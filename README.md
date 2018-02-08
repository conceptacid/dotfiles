The vimrc file is a slightly modified version of the one from here:
https://github.com/zenbro/dotfiles

# Installation of neovim + some other useful tools

sudo apt-get update
sudo apt-get upgrade

sudo apt-get install curl ctags python-pip python3-pip
sudo apt-get install python2.7-dev python3.4


set up window switch on alt-tab, terminal launch opens new terminal window

press upgrade button on the window
install git, clang,

sudo apt-get update
sudo apt-get install git build-essential llvm clang-3.5 lldb3-5

(see https://stackoverflow.com/questions/30549502/installed-clang3-6-on-ubuntu-cant-select-as-alternative/30742451#30742451)

for ubuntu 16 and newer clang version see
https://blog.kowalczyk.info/article/k/how-to-install-latest-clang-5.0-on-ubuntu-16.04-xenial-wsl.html

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang-3.5 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.5 100

If at any time you need to switch back to gcc or g++ you can use the --config option:

sudo update-alternatives --config c++


Create symbolic links for clang

sudo ln -s /usr/bin/clang-3.5 /usr/bin/clang
sudo ln -s /usr/bin/clang++-3.5 /usr/bin/clang++

Install cmake (see https://askubuntu.com/questions/610291/how-to-install-cmake-3-2-on-ubuntu)

wget https://cmake.org/files/v3.10/cmake-3.10.2.tar.gz
tar xf cmake-3.10.2.tar.gz
cd cmake-3.10.2/
./configure
make -j4
sudo make install
cd ..
rm -rf cmake-3.10.2


Install silversearcher

 apt-get install silversearcher-ag

(see https://github.com/ggreer/the_silver_searcher)

Install fzf (see https://github.com/junegunn/fzf)

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install



install neovim (https://askubuntu.com/questions/430008/how-to-install-neovim-on-ubuntu)

sudo add-apt-repository ppa:neovim-ppa/unstable

sudo apt-get update
sudo apt-get install neovim


setup python for neovim
https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim

sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim

Install vim plug

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


clone the dot files and copy them to the appropriate locations
git clone https://github.com/conceptacid/dotfiles.git
cd dotfiles/
cp init.vim ~/.config/nvim/

...the last but not least
curl -fLo ~/.ycm_extra_conf.py https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py


start nvim and hit enter to ignore any errors, the vim plug will install all the missing plugins...


Install Golang

sudo add-apt-repository ppa:gophers/archive
sudo apt-get update

sudo apt-get install golang-go

Add /usr/local/go/bin to the PATH environment
variable. You can do this by adding this line to your 

/etc/profile
(for a system-wide installation) or $HOME/.profile:

export PATH=$PATH:/usr/local/go/bin


## Vim cheatsheet (current configuration)

### navigation
\<leader>a      buffers

\<leader>?      recent files 

### search
\<leader>/      search using ag

