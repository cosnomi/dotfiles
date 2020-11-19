THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH
echo $THISPATH

echo "Deploying vim config"

# Link .vimrc
ln -snf $THISPATH/.vimrc ~/.vimrc

if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "Installing vim plugins"
    vim +'PlugInstall --sync' +qa
fi
