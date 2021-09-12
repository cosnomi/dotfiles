THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH
echo $THISPATH

echo "Deploying vim config"

# Link .vimrc
mkdir -p ~/.config/nvim
for file in init basic-keys basic-visuals plugins lsp-settings
do
    ln -snf $THISPATH/$file.vim ~/.config/nvim/$file.vim
done

ln -snf $THISPATH/lua ~/.config/nvim/lua
mkdir -p ~/.config/efm-langserver
ln -snf $THISPATH/efm-langserver.yaml $HOME/.config/efm-langserver/config.yaml

if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim plugins"
    # vim +'PlugInstall --sync' +qa
    nvim +'PlugInstall --sync' +qa
fi
