The vimrc file is a slightly modified version of the one from here:
https://github.com/zenbro/dotfiles

# Installation of neovim + some other useful tools
Note: this instruction is intended for Ubuntu 14.04 gnome, for newer Ubuntu versions some steps may look different

If you are on a fresh system, you may want to do these first steps:
1) Set up window switch on alt-tab, terminal launch opens new terminal window **\*TODO\***
2) Switch off linux hotkeys for F1-F10 and Ctrl+Left, Ctrl+Right, because we will need to customize them **\*TODO\***
2) Update and upgrade if necessary and install curl, git and build-essential

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install curl git build-essential
```

Install python dev packages, we are going to need it for code completion plugin later...
```bash
sudo apt-get install ctags python-pip python3-pip
sudo apt-get install python2.7-dev python3.4
```

Install ctags
```bash
sudo apt-get install ctags 
```

Install clang,
(see https://stackoverflow.com/questions/30549502/installed-clang3-6-on-ubuntu-cant-select-as-alternative/30742451#30742451)
for ubuntu 16 and newer clang version see
https://blog.kowalczyk.info/article/k/how-to-install-latest-clang-5.0-on-ubuntu-16.04-xenial-wsl.html

```bash
sudo apt-get install git  llvm clang-3.5 lldb3-5

sudo update-alternatives --install /usr/bin/cc cc /usr/bin/clang-3.5 100
sudo update-alternatives --install /usr/bin/c++ c++ /usr/bin/clang++-3.5 100
```

If at any time you need to switch back to gcc or g++ you can use the --config option:

```bash
sudo update-alternatives --config c++
```

Create symbolic links for clang

```bash
sudo ln -s /usr/bin/clang-3.5 /usr/bin/clang
sudo ln -s /usr/bin/clang++-3.5 /usr/bin/clang++
```

Install cmake (see https://askubuntu.com/questions/610291/how-to-install-cmake-3-2-on-ubuntu)


```bash
wget https://cmake.org/files/v3.10/cmake-3.10.2.tar.gz
tar xf cmake-3.10.2.tar.gz
cd cmake-3.10.2/
./configure
make -j4
sudo make install
cd ..
rm -rf cmake-3.10.2
rm cmake-3.10.2.tar.gz
```

Install silversearcher (see https://github.com/ggreer/the_silver_searcher)

```bash
apt-get install silversearcher-ag
```

Install fzf (see https://github.com/junegunn/fzf)

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

install neovim (https://askubuntu.com/questions/430008/how-to-install-neovim-on-ubuntu)

```bash
sudo add-apt-repository ppa:neovim-ppa/unstable
sudo apt-get update
sudo apt-get install neovim
```

setup python for neovim (see https://github.com/zchee/deoplete-jedi/wiki/Setting-up-Python-for-Neovim)
```bash
sudo pip2 install --upgrade neovim
sudo pip3 install --upgrade neovim
```

Install vim plug ***\*TODO: the init.vim config file should auto load vim plug on first start - check if this really works\****
```bash
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Clone the dot files (this repository) and copy them to the appropriate locations
```bash
git clone https://github.com/conceptacid/dotfiles.git
cd dotfiles/
cp init.vim ~/.config/nvim/
rm -rf dotfiles
```
...the last but not least, download the default script for YouCompleteMe into your home directory
```bash
curl -fLo ~/.ycm_extra_conf.py https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py
```

Start neovim nvim and hit enter to ignore any errors, the vim plug will install all the missing plugins...
```bash
nvim .
```

Restart neovim and run :PlugInstall command once again to make sure there are no errors this time.
Now you're done with neovim. 


Install Golang
```bash
sudo add-apt-repository ppa:gophers/archive
sudo apt-get update
sudo apt-get install golang-go
```

Add /usr/local/go/bin to the PATH environment variable. You can do this by adding this line to your `/etc/profile`
(for a system-wide installation) or `$HOME/.profile`:
```bash
export PATH=$PATH:/usr/local/go/bin
```

## Vim cheatsheet (current configuration)

| File navigation   | |
| ----------------  | ----------------------- |
|\<leader>a         |buffers - fzf on buffer names |
|\<leader>A         |windows - fzf on windows names |
|\<leader>/         |search file contents using ag
|\<leader>?         |recent files - fzf on file names |
|\<leader>;         |buffer lines - fzf on contents of all open files |
|\<leader>o         |buffer tags - fzf on tags of all open files |
|\<leader>O         |tags - fzf on all tags |
|\<leader>\<space>  |files - fzf on file names |
|\<leader>?         |history - fzf in history|
|\<leader>.         |search in ...|
|F1                |NerdTree toggle and find |
|F2                |NerdTree toggle |


| code presentation |  |
| ----------------- | ------------- |
| gl                | toggle limelight (hightlights current paragraph) |

| misc | |
| --------------- | ------------------- |
|\<leader>se      | edit unisnips templates   |
