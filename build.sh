set -e
cd ~
if [ -n "$PYTHON_VERSION" ] ; then
	PYTHON="python${PYTHON_VERSION}"
else
	PYTHON="python3"
fi
echo "Using $PYTHON"
TAG="v0.22.1"
git clone --revision="$TAG" --recursive "https://github.com/MagicStack/uvloop"
$PYTHON -m venv venv
. ./venv/bin/activate
pip install -U pip
pip install build
cd ./uvloop
python -m build -w -o ../dist
cd ..
