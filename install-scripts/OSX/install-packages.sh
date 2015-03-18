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
    brew install vim --with-lua
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
    # Deep Learning dev tools
    # ===
    curl http://09c8d0b2229f813c1b93-c95ac804525aac4b6dba79b00b39d1d3.r79.cf1.rackcdn.com/Anaconda-2.1.0-MacOSX-x86_64.sh
    bash Anaconda-2.1.0-MacOSX-x86_64.sh
    rm Anaconda-2.1.0-MacOSX-x86_64.sh
    source ~/anaconda/bin/activate ~/anaconda

    pip uninstall theano
    mkdir ~/python
    git clone https://github.com/Theano/Theano.git ~/python/Theano
    git clone https://github.com/bartvm/blocks.git ~/python/blocks
    git clone https://github.com/bartvm/fuel.git ~/python/fuel
    git clone https://github.com/dwf/picklable_itertools.git ~/picklable_itertools.git
    git clone https://github.com/lisa-lab/pylearn2.git ~/pylearn2
    for d in Theano picklable_itertools blocks fuel pylearn2 ; do
        python ~/$d/setup.py develop

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
