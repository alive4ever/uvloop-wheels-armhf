set -e
useradd -m builder
passwd -d builder
tar -cf - . | su -l builder -c 'tar -C /home/builder -xf -'
