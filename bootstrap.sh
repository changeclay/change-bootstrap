read -p $'\nInstall Command Line Tools for Xcode (requires Apple sign-in at https://developer.apple.com/downloads/index.action) and press enter to continue.'

read -p $'\nInstall Java, for Soloist to run (http://support.apple.com/downloads/DL1421/en_US/JavaForMacOSX10.7.dmg) and press enter to continue.'

# setup your ssh keys for github
if ! [ -e "$HOME/.ssh/id_rsa.pub" ]
then
  echo "Generating ssh key..."
  read -p "Please enter the email you want to associate with your ssh key: " email
  ssh-keygen -t rsa -C "$email"
fi
cat ~/.ssh/id_rsa.pub
cat ~/.ssh/id_rsa.pub | pbcopy
read -p $'\nYour ssh public key has been printed above and copied to the clipboard for convenience. Add it to your Github account at https://github.com/account/ssh and press enter to continue.'

# Chef the machine
git clone git@github.com:changeclay/soloist.git /tmp/soloist
cd /tmp/soloist
git submodule update --init
echo -e "\nAbout to install the Bundler gem, which requires root privileges (you may be asked for your password)\n"
sudo gem install bundler -v1.1.3 --no-ri --no-rdoc
bundle install --path vendor/bundle --binstubs

echo -e "\nRunning Soloist, which requires root privileges (you may be asked for your password)\n"
bin/soloist

# return to directory from which you started
cd -

# cleanup
rm -rf /tmp/soloist