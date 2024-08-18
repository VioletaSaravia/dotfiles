chsh
pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
git config --global user.name "Violeta Saravia"
git config --global user.email "saraviavioleta@gmail.com"
sudo yay -S ttf-jetbrains-mono-nerd man unzip wl-clipboard noto-fonts-emoji dmenu-emoji tlp otf-font-awesome wmenu
sudo yay -R wofi
sudo systemctl enable tlp.service
dmenu-emoji | dmenu | awk {print $1} | tr -d '\n' | wl-copy && wl-paste
bluetoothctl -- devices | dmenu | awk '{print $2}' | xargs bluetoothctl connect
