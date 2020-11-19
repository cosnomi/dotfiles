THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

$THISPATH/vim/deploy.sh
$THISPATH/fish/deploy.sh
$THISPATH/git/deploy.sh
