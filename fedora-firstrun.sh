
#!/bin/bash

# Install complete Fedora Setup from fresh install

#you need to run this script as root/sudo

if [[ $EUID -ne 0 ]]; then
   	echo "This script must be run as root" 
   	exit 1
else

clear

# LET's START:
echo "!!! LET'S START NOW !!!"

read -p "Press enter to check if system is up-to-date before we gonna install all programs"

echo "!!!! System will be updated"

dnf update -y
dnf upgrade -y

echo "!!!! system is updated!"

# START ACTUAL INSTALLS

echo "!!!! Now I'm gonna do the complete software setup for this fresh Fedora XFCE install"

# TOOLS AND UTILITIES

echo "!!!! First let's install depedencies"

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
dnf install -y flatpak

# GRAPHICS AND MULTIMEDIA

echo "!!!! Installing Graphis and multimedia"

echo "Installing VLC. We all love VLC, everybody needs that on his machine!"
dnf install vlc -y

echo "Installing Gimp"
dnf install gimp -y

echo "Installing Audicity"
dnf install audacity -y

echo "Installing Simplescreenrecoder. Thanks Maarten Baert, Awesome job"
dnf install simplescreenrecorder -y

echo "Installing OBS Studio"
dnf install obs-studio -y

echo "Installing KdenLive"
dnf install kdenlive -y

echo "Installing Darktable"
dnf install darktable -y

echo "Installing Digikam"
dnf install digikam -y

echo "Installing Spotify"
flatpak install flathub com.spotify.Client -y
echo "Installing Gradio"
dnf install gradio -y

# ADDING ICONS & THEMES

echo "Adding some icons & themes"

dnf install faience-icon-theme -y
dnf install frei0r-plugins -y

# ADDING TOOLS & UTILITIES

echo "Adding some tools & utilities"
dnf install blivet-gui -y
dnf install lm_sensors -y
dnf install bleachbit -y

echo "Installing Passwordsafe"
dnf copr enable simger/passwordsafe
dnf install passwordsafe -y

# ADDING INTERNET & MAIL & COMMUNICATION

echo "Installing Chrome"
#INSTALL CHROME
dnf install fedora-workstation-repositories -y
dnf config-manager --set-enabled google-chrome
dnf install google-chrome-stable -y

echo "Installing the best emailclient: Thunderbird"
dnf install thunderbird -y

echo "Installing Skype"
wget https://go.skype.com/skypeforlinux-64.rpm
dnf install skypeforlinux-64.rpm -y

# ADDING DEVELOPMENT TOOLS & UTILITIES

echo "Adding Development tools & utilities"
dnf install git -y
dnf install nodejs -y
sudo npm install gulp-cli -g -y

echo "Adding XCLIP for f.e. copying ssh keys"
sudo dnf install xclip -y

#INSTALL VISUAL STUDIO CODE
echo "Installing the awesome VSCODE editor. Microsoft sometimes got things right ;)"
rpm --import https://packages.microsoft.com/keys/microsoft.asc
sh -c "echo -e '[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc' > /etc/yum.repos.d/vscode.repo"
dnf check-update -y
dnf install code -y

echo "Installing VirtualBox"
dnf install VirtualBox -y

echo "Installing Putty & Filezilla. Sometimes this is more convenient"
dnf install filezilla -y
dnf install putty -y

# ADDING DESKTOP PUBLISHING TOOLS

echo "Installing Scribus & Inkscape"
dnf install scribus -y
dnf install inkscape -y

# ADDING OFFICE TOOLS

echo "Installing Libre Office"
dnf install libreoffice -y

echo "Installing Microsoft fonts"
dnf install curl cabextract xorg-x11-font-utils fontconfig -y
dnf install https://downloads.sourceforge.net/project/mscorefonts2/rpms/msttcore-fonts-installer-2.6-1.noarch.rpm -y

echo "Installing Fontawesome fonts"
dnf install fontawesome-fonts -y

echo "Rebuilding font cache"
fc-cache -v


# ADDING ADDITIONAL TOOLS AND PROGRAMS

echo "Installing Conky for making your desktop come alive"
dnf install conky -y

##########echo "Make conky autostart"
####mkdir -p ~/.config/autostart
####cat <<EOF > ~/.config/autostart/conky.desktop
####[Desktop Entry]
####Type=Application
####Exec=/usr/bin/conky
####Hidden=false
####NoDisplay=false
####X-GNOME-Autostart-enabled=true
####Name=conky
####Comment=
####EOF

echo "Installing libgnome-keyring, needed to auto safe for some programms"
dnf install libgnome-keyring -y

echo "Installing some programs to learn blindtyping with 10 fingers"
dnf install gtypist -y
dnf install klavaro -y
dnf install ktouch -y

echo "Installing Guvcview, easy webcam software"
dnf install guvcview -y

echo "Installing Etcher for 'burning' ISO's to USB sticks"
sudo wget https://balena.io/etcher/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.repo
sudo dnf install -y balena-etcher-electron

echo "FINISHED! That went smooth didn it?"
echo "Now start configure some things, you have to do that yourself."
echo "Good luck with that."
echo "Enjoy your Fedora!."
echo "Proudly build for you by MrMarcie."

read -p "Press enter to check for updates. It's always a good idea to check this. And do a restart"

echo "!!!! Checking for updates and excecute them"

dnf update -y
dnf upgrade -y

read -p "Press enter to restart your system or press Q to exit this script"

reboot

#FINISHED
	
fi
