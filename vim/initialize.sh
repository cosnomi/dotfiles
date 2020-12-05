THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Initializing vim"

# Color themes
echo "Downloading vim color themes"
mkdir ~/.vim/colors -p
curl -fLo ~/.vim/colors/molokai.vim \
    https://raw.githubusercontent.com/tomasr/molokai/c67bdfcdb31415aa0ade7f8c003261700a885476/colors/molokai.vim >/dev/null

# Vim plugins
echo "Setting up vim plugins"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >/dev/null
vim +'PlugInstall --sync' +qa
