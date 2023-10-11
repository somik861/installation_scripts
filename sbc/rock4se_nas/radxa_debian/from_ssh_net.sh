set -e

sudo wget -O - https://raw.githubusercontent.com/somik861/installation_scripts/main/sbc/rock4se_nas/radxa_debian/del_user.sh | sudo bash
sudo wget -O - https://raw.githubusercontent.com/somik861/installation_scripts/main/sbc/rock4se_nas/radxa_debian/init_system.sh | sudo bash
sudo wget -O - https://raw.githubusercontent.com/somik861/installation_scripts/main/sbc/rock4se_nas/radxa_debian/fix_initialization.sh | sudo bash
sudo wget -O - https://raw.githubusercontent.com/somik861/installation_scripts/main/sbc/rock4se_nas/radxa_debian/install_omv.sh | sudo bash
