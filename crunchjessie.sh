# ANG: crunchbang Waldorf on Debian 8 Jessie B2
# ANG: for debian 8 jessie themes are still broken. Needs to be redone (see below)
# modified for install after GNOME
mkdir crunchjessie && pushd crunchjessie

# libvala dependency was renamed to vala in trusty, get an older package
wget -c https://launchpad.net/~vala-team/+archive/ubuntu/ppa/+files/libvala-0.10-0_0.10.4-1ubuntu1~lucid1_amd64.deb
sudo dpkg -i libvala-*

# add waldorf repository and install crunchbang packages
sudo apt-get -y --install-recommends install software-properties-common
sudo apt-add-repository 'deb http://packages.crunchbang.org/waldorf waldorf main'
sudo apt-key adv --fetch-keys http://packages.crunchbang.org/waldorf-dev/crunchbang.key
sudo apt-get -y update
# ANG: use gdm3 ! - try slim later
sudo apt-get -y --install-recommends install cb-metapackage cairo-compmgr faenza-crunchbang-icon-theme
# ANG: error during install tint2 - sudo apt-get install -f fixes
sudo apt-get install -f

# set up home directory
cp -R /etc/skel/. ~/

# set up boot theme: ANG - needs to be set up later - boot-customizer ?
sudo cp /etc/default/grub /etc/default/grub.orig
sudo sed -i -E 's/(GRUB_CMDLINE_LINUX_DEFAULT=).*/\1"--verbose nosplash debug"/g' /etc/default/grub
sudo update-grub

# gtk-3.8+ breaks Waldorf theme, use an alternative
# ANG: for debian 8 jessie themes are still broken. Needs to be redone
wget -c https://github.com/xoraxiom/openbox-gtk-themes/archive/master.zip
unzip master.zip
sudo cp -r openbox-gtk-themes-master/cb-waldorf-xoraxiom /usr/share/themes
sudo cp /root/.config/gtk-3.0/settings.ini /root/.config/gtk-3.0/settings.ini.orig
sudo sed -i -E 's/(gtk-theme-name\s*=).*/\1cb-waldorf-xoraxiom/g' /root/.config/gtk-3.0/settings.ini
cp ~/.config/gtk-3.0/settings.ini ~/.config/gtk-3.0/settings.ini.orig
sed -i -E 's/(gtk-theme-name\s*=).*/\1cb-waldorf-xoraxiom/g' ~/.config/gtk-3.0/settings.ini
cp ~/.gtkrc-2.0 ~/.gtkrc-2.0.orig
sed -i -E 's/(gtk-theme-name\s*=).*/\1\"cb-waldorf-xoraxiom\"/g' ~/.gtkrc-2.0
sed -i -E 's/(gtk-icon-theme-name\s*=).*/\1\"Faenza-Dark-CrunchBang\"/g' ~/.gtkrc-2.0

# start X and the Crunchbang auto setup
# ANG start
#popd && rm -r crunchbuntu
# ANG: next line hanging in VMware. What about real machine ?
sudo shutdown -r now
# ANG end
