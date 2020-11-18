# fishのセットアップ
# Set up fish environment

apt update
apt upgrade -y 

apt-add-repository ppa:fish-shell/release-3
apt-get update
apt-get install fish

chsh -s /usr/bin/fish
curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
