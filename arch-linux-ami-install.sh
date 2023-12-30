sudo su

sudo pacman -Syy

pacman-key --init

# To Generate master keys

pacman-key --populate

# To add Developer keys

# It takes a time to refresh keys so just give 3 mins of time incase you want to refresh keys

# pacman-key --refresh-keys  

pacman -S archlinux-keyring -y

pacman -S -yy -u -y

pacman -S --needed base-devel git

pacman -S -yy -u -y

exit

# To install yay

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

yay --version