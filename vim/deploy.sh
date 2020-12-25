THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH
echo $THISPATH

echo "Deploying vim config"

# Link .vimrc
ln -snf $THISPATH/init.vim ~/.vimrc
mkdir -p ~/.config/nvim
for file in init basic-keys basic-visuals plugins lsp-settings
do
    ln -snf $THISPATH/$file.vim ~/.config/nvim/$file.vim
done

if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim plugins"
    # vim +'PlugInstall --sync' +qa
    nvim +'PlugInstall --sync' +qa
fi
