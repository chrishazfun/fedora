# curl -s https://chrishaz.fun/fedora.sh | bash

# general update
echo "Updating"
sudo dnf update -y

# removing some default fedora ws apps/packages
sudo dnf remove gnome-terminal -y
sudo dnf remove gnome-terminal-nautilus -y
sudo dnf remove nautilus -y
sudo dnf remove gnome-tour -y
sudo dnf remove rhythmbox -y

# flathub/installing stuff that isn't on dnf
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
flatpak install flathub net.pcsx2.PCSX2
flatpak install flathub net.rpcs3.RPCS3

# import rpmfusion free/non-free
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# sublime stuff for dnf installation
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg -y
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo -y

# dnf install
sudo dnf install wine -y
sudo dnf install steam -y
sudo dnf install konsole5 -y
sudo dnf install pcsx2 -y
sudo dnf install sublime-text -y

# dnf install - gnome shell extensions
sudo dnf install gnome-shell-extensions -y
sudo dnf install chrome-gnome-shell -y

# nvidia drivers
sudo dnf install akmod-nvidia -y
sudo dnf install xorg-x11-drv-nvidia-cuda-libs -y

echo "Restoring preferred dconf values"
sudo dconf load / < dconf.ini
