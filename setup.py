import os
import shutil
import platform
from subprocess import Popen
from functools import wraps


def wrap(func):
    @wraps(func)
    def wrapper(*args, **kwargs):
        print(func.__name__, *args, **kwargs)
        try:
            return func(*args, **kwargs)
        except FileNotFoundError:
            pass
    return wrapper


sh = wrap(lambda x: Popen(x, shell=True).communicate())
cp = wrap(shutil.copy2)


def get_path(*path, home=False):
    script_path = os.path.realpath(__file__)
    script_dir = os.path.expanduser('~') if home else os.path.dirname(script_path)
    return os.path.join(script_dir, *path)


def common():
    """
    rc file copy
    """
    cp(get_path('.vimrc', home=True), get_path('.vimrc.backup',
       home=True))
    cp(get_path('vimrc'), get_path('.vimrc', home=True))
    sh('vim +PluginInstall +qall')

    cp(get_path('.zshrc', home=True), get_path('.zshrc.backup',
       home=True))
    cp(get_path('zshrc'), get_path('.zshrc', home=True))
    sh('zsh ~/.zshrc')

    # cp(get_path('.ipython', 'profile_default', 'ipython_config.py', home=True),
    #    get_path('.ipython', 'profile_default', 'ipython_config.py.backup',
    #             home=True))
    # cp(get_path('ipython_config.py'),
    #    get_path('.ipython', 'profile_default', 'ipython_config.py', home=True))


def darwin():
    """
    OSX Setup
    """
    if os.path.exists(get_path(platform.system().lower(), 'setup.sh')):
        sh('bash setup.sh')
    else:
        sh('brew install zsh')
        sh('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
        sh('git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions')
        sh('. ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh')
        sh('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')

        # FIXME: IPython settings
        sh('pip install virtualenv')
        sh('virtualenv -p python3 ~/gvenv')
        sh('. ~/gvenv/bin/activate')
        sh('pip install ipython[all]')
        sh('pip install itermplot')

    common()


def linux():
    """
    Ubuntu
    """
    if os.path.exists(get_path(platform.system().lower(), 'setup.sh')):
        sh('bash setup.sh')
    else:
        # sh('apt update')
        # sh('apt install zsh')
        sh('sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"')
        sh('git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions')
        sh('zsh ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh')
        sh('git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim')


        # # FIXME: IPython settings
        # sh('pip install virtualenv')
        # sh('virtualenv -p python3 ~/gvenv')
        # sh('. ~/gvenv/bin/activate')
        # sh('pip install ipython[all]')
        pass

    common()


if __name__ == '__main__':
    uname = platform.system()
    eval(uname.lower() + '()')

