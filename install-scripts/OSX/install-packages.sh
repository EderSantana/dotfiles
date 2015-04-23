#==============
# Install all the packages
#==============
echo -n "Install all the packages (Y/n) => "; read answer
if [[ $answer = "Y" ]] ; then

    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew doctor
    brew update

    # So we use all of the packages we are about to install
    echo "export PATH='/usr/local/bin:$PATH'\n" >> ~/.bashrc
    source ~/.bashrc

    # ===
    # The regular brew installable packages
    # ===
    brew install zsh
    brew install vim --with-lua --with-python3 --with-clientserver
    brew install tig
    brew install aspell
    brew install node
    brew install reattach-to-user-namespace --wrap-pbcopy-and-pbpaste
    brew install ack
    brew install tmux
    brew install the_silver_searcher

    # ===
    # Get Ctags properly setup
    # Brew install and do away with the busted default version of ctags
    # ===
    brew install ctags
    sudo mv /usr/bin/ctags /usr/bin/ctags_orig

    # ===
    # Install pip and global pip packages
    # ===
    sudo easy_install pip
    sudo pip install virtualenvwrapper
    sudo pip install jedi
    sudo pip install flake8
    sudo gem install CoffeeTags

    # ===
    # Gollum set up
    # ===
    #echo -n "Do you want to maintain a wiki using gollum? (Y/n) => "; read wiki
    #if [[ $wiki = "Y" ]] ; then
    #    brew install icu4c
    #    sudo gem install gollum
    #    sudo gem install redcarpet
    #fi

fi
