THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Deploying tmux config"

# Link .tmux.conf
ln -snf $THISPATH/.tmux.conf ~/.tmux.conf
