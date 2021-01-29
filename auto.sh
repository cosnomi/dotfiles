THISPATH=$(cd $(dirname $0); pwd)

echo 'PATH=$HOME/bin:$PATH' >> $HOME/.bashrc
export PATH=$HOME/bin:$PATH

$THISPATH/apt-install.sh
$THISPATH/deploy.sh
$THISPATH/initialize.sh
