# curl -s https://chrishaz.fun/fedora.sh | bash

echo "Updating"
sudo dnf update -y

echo "Removing"
sudo dnf remove gnome-terminal gnome-terminal-nautilus gnome-tour rhythmbox nautilus -y

echo "Seperate Sublime thing for some reason"
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg -y
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo -y

echo "Snap/RPMFusion"
sudo dnf install appstream-data snapd -y
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

echo "Creating symbolic link for 'classic snap' support just in case"
sudo ln -s /var/lib/snapd/snap /snap

echo "Installing snaps"
sudo snap install rpcs3-emu spotify

echo "Installing"
sudo dnf install wine steam gamemode konsole5 sublime-text pcsx2 -y

echo "Restoring preferred dconf values"
sudo dconf load / < dconf.ini

echo "Last one since this requires rebooting to work - Installing latest Nvidia drivers"
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda-libs -y

echo "Thats about it for now :)"
