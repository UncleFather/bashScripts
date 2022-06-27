######################################## part 1 ########################################
sudo cp Desktop/Automate_Astra01.sh Desktop/aa.sh
sudo chmod ugo+x Desktop/Automate_Astra01.sh
sudo chmod ugo+x Desktop/aa.sh

sudo sh -c "sed -i '1,9d' Desktop/aa.sh"
sudo Desktop/aa.sh
exit

read -p "Enter ip address: " ipaddrr
sudo nmcli con mod "Проводное соединение 1" ipv4.address "192.168.0.$ipaddrr/24" ipv4.gateway "192.168.0.1" ipv4.dns "192.168.0.1, 192.168.0.2, 8.8.8.8"
sudo nmcli con mod "Проводное соединение 1" ipv4.method manual
sudo sh -c "echo '192.168.0.8   kasper.ru' >> /etc/hosts"
sudo nmcli con down "Проводное соединение 1" ; nmcli con up "Проводное соединение 1"
sudo systemctl restart NetworkManager

sudo apt install dos2unix
dos2unix Desktop/Automate_Astra01.sh

#sudo su
sudo wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | sudo apt-key add -
sudo sh -c 'echo "deb http://deb.anydesk.com/ all main" >> /etc/apt/sources.list.d/anydesk-stable.list'
sudo apt-get update
echo Y | sudo apt-get install anydesk
#Настроить AnyDesk

sudo wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
sudo apt-get update
echo Y | sudo apt-get install google-chrome-stable
su user -c '/usr/bin/google-chrome-stable' & sleep 10; sudo pkill -f chrome; sleep 10; su user -c 'mv Desktop/Preferences ~/.config/google-chrome/Default/Preferences'
#Настроить параметры GoogleChrome

wget https://repo.skype.com/latest/skypeforlinux-64.deb
sudo dpkg -i skypeforlinux-64.deb

sudo apt-get update
echo Y | sudo apt-get full-upgrade
echo Y | sudo apt-get upgrade
echo Y | sudo apt-get dist-upgrade
sudo sh -c "sed -i '1,33d' Desktop/aa.sh"
reboot
######################################## part 2 ########################################
#sudo su
echo Y | sudo apt-get autoremove
echo Y | sudo apt-get clean
echo Y | sudo apt-get autoclean

echo "MyPass123" | adduser admin
usermod -a -G astra-admin,astra-console,root
sudo sh -c "echo -e 'MyPass123\nMyPass123\n' | passwd admin"
sudo sed -i".bak" "s/per_user deny=8/per_user deny=8 unlock_time=1200/" /etc/pam.d/common-auth

sudo cp /home/user/.fly/startmenu/network/google-chrome.desktop /usr/share/applications/flydesktop/google-chrome.desktop
sudo cp /home/user/.fly/startmenu/network/skypeforlinux.desktop /usr/share/applications/flydesktop/skypeforlinux.desktop
sudo cp /home/user/.fly/startmenu/office/libreoffice-writer.desktop /usr/share/applications/flydesktop/libreoffice-writer.desktop
sudo cp /home/user/.fly/startmenu/office/libreoffice-calc.desktop /usr/share/applications/flydesktop/libreoffice-calc.desktop
sudo cp /home/user/.fly/startmenu/systemapps/fly-term.desktop /usr/share/applications/flydesktop/fly-term.desktop

sudo timedatectl set-timezone Asia/Yekaterinburg
sudo systemctl start ntp

sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
sudo sh -c "sed -i '1,24d' Desktop/aa.sh"
sudo systemctl restart systemd-logind.service

######################################## part 3 ########################################

sudo apt-get install ia32-libs
echo Y | sudo apt-get install wine
echo Y | sudo apt-get install playonlinux

read -p "Enter new computer name?" compname
sudo hostname $compname
sudo hostnamectl set-hostname $compname
sudo sysctl kernel.hostname=$compname
sudo sed -i".bak" "s/astra/$compname/" /etc/hosts

wget https://products.s.kaspersky-labs.com/endpoints/keslinux10/11.0.0.2706/multilanguage-INT-11.0.1.2706/3239363337307c44454c7c31/klnagent64_12.0.0-45_amd64.deb
sudo dpkg -i klnagent64_12.0.0-45_amd64.deb
sudo /opt/kaspersky/klnagent64/lib/bin/setup/postinstall.pl

sudo /opt/kaspersky/klnagent64/bin/klnagchk -restart

#Настроить AnyDesk
#Настроить параметры GoogleChrome
#Настроить агент KES - sme74.ru
#Установить и обновить KES

sudo sh -c "sed -i '1,26d' Desktop/aa.sh"
exit
######################################## part 4 ########################################
#Cleaning

sudo sh -c "sed -i '$ d' /etc/hosts"

sudo nmcli con mod "Проводное соединение 1" ipv4.method auto
sudo nmcli connection modify "Проводное соединение 1" ipv4.gateway "" ipv4.address "" -ipv4.dns "192.168.0.1" -ipv4.dns "192.168.0.2" -ipv4.dns "8.8.8.8"

sudo rm Desktop/Automate_Astra01.sh
sudo rm Desktop/aa.sh

exit
sudo nmcli con down "Проводное соединение 1" ; nmcli con up "Проводное соединение 1"
sudo systemctl restart NetworkManager

#sudo apt-cache search skype*
