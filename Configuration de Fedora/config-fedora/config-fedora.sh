#!/bin/bash

username=$(zenity --entry --title="Nom d'utilisateur" --text="Entrez votre nom d'utilisateur (en minuscule)")
RPMFUSIONCOMP="rpmfusion-free-appstream-data rpmfusion-nonfree-appstream-data rpmfusion-free-release-tainted rpmfusion-nonfree-release-tainted"
GNOMECOMP="gnome-extensions-app gnome-shell-extension-dash-to-dock"
CODEC="gstreamer1-plugins-base gstreamer1-plugins-good gstreamer1-plugins-bad-free gstreamer1-plugins-good-extras gstreamer1-plugins-bad-free-extras gstreamer1-plugins-ugly-free gstreamer1-plugin-libav gstreamer1-plugins-ugly libdvdcss gstreamer1-plugin-openh264"
FLATPAKAPP="com.visualstudio.code org.gimp.GIMP org.flameshot.Flameshot org.keepassxc.KeePassXC org.videolan.VLC com.github.marinm.songrec org.soundconverter.SoundConverter com.mattjakeman.ExtensionManager org.gnome.Extensions io.github.flattool.Warehouse"
ADDAPP="aspell-fr amd-ucode-firmware seahorse gnome-tweaks file-roller dconf-editor gnome-boxes abrt screen vim-enhanced ShellCheck htop nmon glances neofetch screenfetch fastfetch inxi lm_sensors nvtop ncdu cronie nfs-utils sl nyancat nwipe sg3_utils ecryptfs-utils netcat nmap iftop traceroute fuse-sshfs telnet borgbackup soundconverter virtualbox cool-retro-term gparted btrfs-assistant"


config_dnf(){
	echo -e "\033[1;32m==========Configuration de dnf==========\033[0m"
	if [[ $(grep -c 'fastestmirror=' /etc/dnf/dnf.conf) -lt 1 ]]
	then
		echo "fastestmirror=true" >> /etc/dnf/dnf.conf
	fi
	if [[ $(grep -c 'max_parallel_downloads=' /etc/dnf/dnf.conf) -lt 1 ]]
	then
		echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf
	fi
	if [[ $(grep -c 'countme=' /etc/dnf/dnf.conf) -lt 1 ]]
	then
		echo "countme=false" >> /etc/dnf/dnf.conf
	fi
	if [[ $(grep -c 'deltarpm=' /etc/dnf/dnf.conf) -lt 1 ]]
	then
		echo "deltarpm=false" >> /etc/dnf/dnf.conf
	fi
	echo ""
}

copy_of_files(){
	echo -e "\033[1;32m==========Copie des fichiers utiles==========\033[0m"
	echo ""
    if [[ $(grep -c "fmaj=" /home/loan/.bashrc) -lt 1 ]] ; then
    echo '

alias maj="sudo dnf upgrade -y"
alias install="sudo dnf install -y"
alias remove="sudo dnf remove -y"
alias finstall="flatpak install flathub -y"
alias fremove="flatpak remove -y"
alias fmaj="flatpak update -y"
alias fsearch="flatpak search"' >> /home/"$username"/.bashrc
	fi
	cd ./config-fedora/
	cd ./dynamic-wallpapers/
	cp -r ./Dynamic_Wallpapers/ /usr/share/backgrounds/
	cp ./xml/* /usr/share/gnome-background-properties/
	cp ./Screenshots_dynamic_wallpapers/ /home/"$username"/Images/
	cp ./CREDITS.txt /home/"$username"/Images/
	cd ..
	cp ./"Chemin d'accès" /home/"$username"/.local/share/nautilus/scripts/
	cp -r ./wallpapers/ /home/"$username"/Images/
	chown -R "$username":"$username" /home/"$username"/Images/wallpapers/
	chown -R "$username":"$username" /home/"$username"/Images/Screenshots_dynamic_wallpapers/
	chown "$username":"$username" /home/"$username"/Images/CREDITS.txt
	echo ""
}

maj(){
	echo -e "\033[1;32m==========Mises à jour==========\033[0m"
	echo ""
	echo "Mise à jour de flatpak"
	echo ""
	flatpak update -y
	echo ""
	echo "Mise à jour du système"
	echo ""
	dnf upgrade -y
	echo ""
	dnf clean packages
	echo ""
}

install_app(){
	echo -e "\033[1;32m==========Installation d'applications==========\033[0m"
	echo ""
	echo -e "\033[1;32mInstallation des composants RPM Fusion\033[0m"
	echo ""
	dnf install -y $RPMFUSIONCOMP
	echo ""
	echo -e "\033[1;32mInstallation RPM Fusion Free\033[0m"
	echo ""
	dnf install -y "https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm"
	echo ""
	echo -e "\033[1;32mInstallation RPM Fusion NonFree\033[0m"
	echo ""
	dnf install -y "https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm"
	echo ""
	echo -e "\033[1;32mInstallation des Codecs\033[0m"
	echo ""
	dnf install -y $CODEC
	echo ""
	echo -e "\033[1;32mInstallation des logiciels Flatpak\033[0m"
	echo ""
	flatpak install flathub -y $FLATPAKAPP
	echo ""
	echo -e "\033[1;32mInstallation des logiciels Fedora\033[0m"
	echo ""
	dnf install -y $ADDAPP
	echo ""
	echo -e "\033[1;32mInstallation des composants GNOME\033[0m"
	echo ""
	dnf install -y $GNOMECOMP
}

main(){
    config_dnf
    copy_of_files
    maj
    install_app
}

main
