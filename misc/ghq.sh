type go > /dev/null 2>&1 || apt install -y golang-go
git clone https://github.com/x-motemen/ghq ~/ghq
cd ~/ghq
make install
