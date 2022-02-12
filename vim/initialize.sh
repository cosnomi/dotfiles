THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

# Install nvim
echo "Setting up neovim"
mkdir -p $HOME/AppImage
cd $HOME/AppImage
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
chmod u+x ./nvim.appimage
./nvim.appimage -v
./nvim.appimage --appimage-extract > /dev/null
mv squashfs-root neovim-root
./neovim-root/AppRun --version
mkdir $HOME/bin
ln -s $HOME/AppImage/neovim-root/AppRun $HOME/bin/nvim

# Plugins
echo "Setting up vim-plug"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

echo "Installing plugins. Please wait..."
nvim +'PlugInstall --sync' +qa
