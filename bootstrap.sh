read -p "Install Command Line Tools for Xcode (requires Apple sign-in at https://developer.apple.com/downloads/index.action) and press enter to continue."

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
