```
# Pre-install permission packages not using sudoers!
sudo apt update
sudo apt install zsh

# Add user
sudo adduser test --disabled-password

sudo su - test
git clone https://github.com/lastone9182/transplant_rc.git
python3 setup.py

# Test finished
sudo userdel -r test
```