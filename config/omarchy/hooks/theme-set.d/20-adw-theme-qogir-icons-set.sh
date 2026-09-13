#!/bin/bash

gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'
gsettings set org.gnome.desktop.interface icon-theme 'Qogir-Ubuntu-Dark'
gsettings set org.gnome.desktop.wm.preferences button-layout ''

mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini <<'EOF'
[Settings]
gtk-theme-name=adw-gtk3-dark
gtk-icon-theme-name=Qogir-Ubuntu-Dark
EOF

mkdir -p ~/.config/gtk-4.0
cat > ~/.config/gtk-4.0/settings.ini <<'EOF'
[Settings]
gtk-icon-theme-name=Qogir-Ubuntu-Dark
EOF

gtk-update-icon-cache -f /usr/share/icons/Qogir-Ubuntu-Dark 2>/dev/null
