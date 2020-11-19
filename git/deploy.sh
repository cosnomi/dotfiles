THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH
echo $THISPATH

echo "Deploying git config"

# Link .gitconfig
ln -snf $THISPATH/.gitconfig ~/.gitconfig
