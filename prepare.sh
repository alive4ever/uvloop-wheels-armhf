set -e
useradd -m builder
passwd -d builder
command -v patchelf || apt-get install -y patchelf
tar -cf - . | su -l builder -c 'tar -C /home/builder -xf -'
