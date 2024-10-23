#!/bin/bash

echo "Configuration générale de GNOME"
echo " - Boutons de fenêtre"
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
echo " - Suramplification"
gsettings set org.gnome.desktop.sound allow-volume-above-100-percent true
echo " - Affichage du calendrier dans le panneau supérieur"
gsettings set org.gnome.desktop.calendar show-weekdate true
echo " - Modification du format de la date et heure"
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface clock-show-seconds true
gsettings set org.gnome.desktop.interface clock-show-weekday true
gsettings set org.gnome.desktop.interface clock-format "24h"
echo " - Paramétrage Touch Pad"
gsettings set org.gnome.desktop.peripherals.touchpad disable-while-typing true
gsettings set org.gnome.desktop.peripherals.touchpad click-method "areas"
echo " - Epuration des fichiers temporaires et de la corbeille de plus de 30 jours"
gsettings set org.gnome.desktop.privacy remove-old-temp-files true
gsettings set org.gnome.desktop.privacy remove-old-trash-files true
gsettings set org.gnome.desktop.privacy old-files-age "30"

echo "Configuration Nautilus"
echo " - Désactivation de l ouverture du dossier lorsqu un élément est glissé dedans"
gsettings set org.gnome.nautilus.preferences open-folder-on-dnd-hover false
echo " - Activation du double clic"
gsettings set org.gnome.nautilus.preferences click-policy 'double'
echo " - Modification de l ordre de tri"
gsettings set org.gtk.Settings.FileChooser sort-directories-first true
gsettings set org.gtk.gtk4.Settings.FileChooser sort-directories-first true

echo "Configuration de GNOME Text Editor"
gsettings set org.gnome.TextEditor highlight-current-line false
gsettings set org.gnome.TextEditor show-line-numbers true

echo "Personnalisation terminée."
