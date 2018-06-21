# transplant_rc

Platform-free setup rc files

## Coverage

- AWS Ubuntu :white_check_mark:

## Usage

1. Fork this repo.

2. Push vimrc, zshrc etc.

3. Git clone in new environment.

4. `python3 setup.py`

## Test Environment

Create `test` user and rc test.

→ Check md files

## Docker

```
docker build -t py3 .
docker run -it py3
docker container ls -all
docker start <CONTAINER_ID>
docker attach <CONTAINER_ID>
```
