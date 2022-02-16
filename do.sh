# curl -s https://chrishaz.fun/fedora.sh | bash

echo "Updating - Removing - Installing"
sleep 2

sudo dnf update -y
sudo dnf remove gnome-terminal gnome-terminal-nautilus -y
sudo dnf install wine steam gamemode konsole5 snapd -y

echo "Create symbolic link for 'classic snap' support just in case"
sudo ln -s /var/lib/snapd/snap /snap

echo "Installing stuff i couldn't before :P"
sudo snap install rpcs3-emu

echo "Restoring preferred dconf values"
dconf load / < dconf.ini

echo "Thats about it for now :)"
