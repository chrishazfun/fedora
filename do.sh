# curl -s https://chrishaz.fun/fedora.sh | bash

sudo cat <<EOF >>/etc/dnf/dnf.conf
[main]
gpgcheck=1
installonly_limit=3
clean_requirements_on_remove=True
best=False
skip_if_unavailable=True
fastestmirror=True
max_parallel_downloads=10
defaultyes=True
keepcache=True
EOF

# general update
sudo dnf update -y

# enable fstrim
systemctl enable --now fstrim.timer

# ananicy for better performance
git clone https://github.com/Nefelim4ag/Ananicy.git /tmp/ananicy
cd /tmp/ananicy
sudo make install
sudo systemctl enable ananicy -y
sudo systemctl start ananicy -y
cd

# removing some default fedora ws apps/packages
sudo dnf remove gnome-tour rhythmbox -y

# flathub/installing stuff that isn't on dnf
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.spotify.Client
flatpak install flathub net.pcsx2.PCSX2
flatpak install flathub net.rpcs3.RPCS3

# import rpmfusion free/non-free
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# install media codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia

# sublime stuff for dnf installation
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo

# dnf install
sudo dnf install wine steam sublime-text -y

# dnf install - gnome shell extensions
sudo dnf install gnome-shell-extensions chrome-gnome-shell gnome-shell-extension-no-overview -y

# nvidia drivers
sudo dnf install akmod-nvidia xorg-x11-drv-nvidia-cuda-libs -y

echo "Restoring preferred dconf values"
sudo dconf load / < dconf.ini
