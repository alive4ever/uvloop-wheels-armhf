set -e
if ! [ -d /home/builder/dist ] ; then
	echo 'Unable to find built wheels directory'
	exit 127
fi
cp -rv /home/builder/dist /io/
