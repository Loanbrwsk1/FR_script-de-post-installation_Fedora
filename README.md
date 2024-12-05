# FR_script-de-posta-installation_Fedora

Script de post-installation qui va installer certains logiciels, rajouter quelques fichiers tels que des fonds d'écran et mettre à jour le système en un seul clic pour Fedora (toutes versions).

## Applis installées

### Extensions

Les extensions sont utiles pour avoir une meilleur approche de Fedora.
Celles-ci sont installées : 

- Dash-to-dock (barre des tâches)
- Gestionnaire d'extensions

### Applications

#### RPM

- aspell-fr 
- amd-ucode-firmware 
- seahorse  
- file-roller  
- gnome-boxes 
- abrt 
- screen 
- vim-enhanced 
- ShellCheck 
- lm_sensors 
- nvtop 
- ncdu 
- cronie 
- nfs-utils 
- nwipe 
- sg3_utilsiftop 
- traceroute 
- fuse-sshfs 
- telnet borgbackup
- Ajustement (pour ajuster certains paramètres supplémentaires)
- dconf editor
- htop 
- nmon 
- glances 
- neofetch, screenfetch, fastfetch 
- inxi
- sl 
- nyancat 
- ecryptfs-utils 
- netcat 
- nmap 
- soundconverter 
- virtualbox 
- cool-retro-term 
- gparted 
- btrfs-assistant

#### Flatpak (Dépôt Flathub)

- VSCode 
- Gimp
- Flameshot
- KeePassXC
- VLC 
- SongRec 
- SoundConverter 
- ExtensionManager 
- Extensions 
- Warehouse

### Composants RPM Fusion

- rpmfusion-free-appstream-data 
- rpmfusion-nonfree-appstream-data 
- rpmfusion-free-release-tainted 
- rpmfusion-nonfree-release-tainted

### Codecs

- gstreamer1-plugins-base 
- gstreamer1-plugins-good 
- gstreamer1-plugins-bad-free 
- gstreamer1-plugins-good-extras 
- gstreamer1-plugins-bad-free-extras 
- gstreamer1-plugins-ugly-free 
- gstreamer1-plugin-libav 
- gstreamer1-plugins-ugly 
- libdvdcss 
- gstreamer1-plugin-openh264

## Autres

De plus, ce script ajuste la configuration de DNF pour rendre plus rapide les mises à jour et les installations de logiciels en lignes de commande.

Mises à jour des flatpaks, des applications et du système. Vous pouvez lancer le script autant de fois que nécessaire.

De plus, ce script offre la possibilité de configurer GNOME. Pour plus d'informations, voir README-custom.txt dans le dossier.

Pour plus d'informations, voir README.txt dans le dossier.