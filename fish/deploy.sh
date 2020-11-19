THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Deploying fish config"

mkdir -p ~/.config/fish
ln -snf $THISPATH/config.fish ~/.config/fish/config.fish
