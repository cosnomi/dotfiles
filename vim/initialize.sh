THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Initializing vim"

# Install nvim
echo "Setting up neovim"
mkdir -p $HOME/AppImage
cd $HOME/AppImage
wget "https://github.com/neovim/neovim/releases/download/v0.4.4/nvim.appimage"
chmod a+x nvim.appimage
mkdir ~/bin
ln -snf $HOME/AppImage/nvim.appimage ~/bin/nvim 
echo "Symlink to nvim appimage was created. If the system does not deal with AppImage properly, further action may be needed to run neovim."

# Vim plugins
echo "Setting up vim-plug"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing plugins. Please wait..."
vim +'PlugInstall --sync' +qa
nvim +'PlugInstall --sync' +qa
