THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

apt-get install software-properties-common
apt-add-repository ppa:fish-shell/release-3 >/dev/null
apt-get update -y >/dev/null
apt-get install fish -y >/dev/null

chsh -s /usr/bin/fish

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish >/dev/null
