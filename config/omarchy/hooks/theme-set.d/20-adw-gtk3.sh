#!/bin/bash

gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3-dark'

mkdir -p ~/.config/gtk-3.0
cat > ~/.config/gtk-3.0/settings.ini <<'EOF'
[Settings]
gtk-theme-name=adw-gtk3-dark
EOF
