THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Initializing fish"

apt-get install software-properties-common -y
apt-add-repository ppa:fish-shell/release-3 -y
#apt-get update -y >/dev/null
apt-get install fish -y

# Do not chsh

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish >/dev/null
