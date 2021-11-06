THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Running apt install"

apt update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
cat $THISPATH/apt-packages.txt | xargs apt install -y

# ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
sudo dpkg -i ripgrep_13.0.0_amd64.deb

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

