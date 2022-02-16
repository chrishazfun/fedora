# curl -s https://chrishaz.fun/fedora.sh | bash

echo "Updating..."
sudo dnf update -y

echo "Removing..."
sudo dnf remove gnome-terminal gnome-terminal-nautilus rhythmbox nautilus -y

echo "Installing..."
sudo dnf install wine steam gamemode konsole5 snapd -y

# snaps instead of official appimages so they can be updated seamlessly

echo "Creating symbolic link for 'classic snap' support just in case"
sudo ln -s /var/lib/snapd/snap /snap

echo "Installing stuff I couldn't before :P"
sudo snap install rpcs3-emu spotify

echo "Restoring preferred dconf values"
sudo dconf load / < dconf.ini

echo "Last one since this requires rebooting to work - Installing latest Nvidia drivers"
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda-libs -y

echo "Thats about it for now :)"
