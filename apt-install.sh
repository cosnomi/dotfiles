THISPATH=$(cd $(dirname $0); pwd)
cd $THISPATH

echo "Running apt install"

apt update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
cat $THISPATH/apt-packages.txt | xargs apt install -y
