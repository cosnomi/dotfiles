THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Deploying fish config"

mkdir -p ~/.config/fish
ln -snf $THISPATH/config.fish ~/.config/fish/config.fish
ln -snf $THISPATH/fish_plugins ~/.config/fish/fish_plugins

echo "To enable plugins, run 'fisher update' in fish shell"
