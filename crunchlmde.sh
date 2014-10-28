# ANG: crunchbang Waldorf on LMDE:
# wget https://github.com/smersh2/crunchbuntu/archive/master.tar.gz
# tar -xpf master.tar.gz
# cd <unzipped>
# ./crunchlmde.sh
# ANG: installed as debian 7 netinstall. Next cb-netinstall => crunchbang
# Next /etc/apt/ changed for /etc/apt/ from LMDE, update/upgrade/dist-upgrade
# Correct waldorf theme (without fixing vala - no dependency problem):
# libvala dependency was renamed to vala in trusty, get an older package
#wget -c https://launchpad.net/~vala-team/+archive/ubuntu/ppa/+files/libvala-0.10-0_0.10.4-1ubuntu1~lucid1_amd64.deb
#sudo dpkg -i libvala-*
# gtk-3.8+ breaks Waldorf theme, use an alternative
wget -c https://github.com/xoraxiom/openbox-gtk-themes/archive/master.zip
unzip master.zip
sudo cp -r openbox-gtk-themes-master/cb-waldorf-xoraxiom /usr/share/themes
# ANG: for LMDE no settings.ini + sed is not working
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
