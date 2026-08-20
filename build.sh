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
curl -L -o uv.sh https://astral.sh/uv/install.sh
sh uv.sh
PATH=$HOME/.local/bin:$PATH
command -v uv || exit 127
uv venv --python $PYTHON_VERSION venv
. ./venv/bin/activate
cd ./uvloop
echo "setuptools<=82.0.0" > constrainst.txt
uv build --build-constrainst ./constrainst.txt --wheel --out-dir ../dist
cd ..
