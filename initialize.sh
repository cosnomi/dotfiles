# echo "apt"
THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

# apt update > /dev/null
# apt upgrade -y > /dev/null
# apt install -y curl git vim > /dev/null

$THISPATH/vim/initialize.sh
$THISPATH/fish/initialize.sh
$THISPATH/git/initialize.sh
$THISPATH/tmux/initialize.sh
