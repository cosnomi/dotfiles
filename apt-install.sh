THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Deploying fish config"

apt update -y
cat $THISPATH/apt-packages.txt | xargs apt install -y
