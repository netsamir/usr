#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PREFDIR="$HOME/local"

cd "${BASEDIR}"
curl -O http://ftp.gnu.org/gnu/wget/wget-1.15.tar.gz

tar -zxvf wget-1.15.tar.gz
cd wget-1.15/
./configure --with-ssl=openssl --prefix=$PREFDIR
make && make install
rm -rf "${BASEDIR}"/wget*

# Install this in order to use copy/paste
# between screen in tmux
brew install reattach-to-user-namespace


# download source files for tmux, libevent, and ncurses

#wget https://github.com/downloads/libevent/libevent/libevent-2.0.19-stable.tar.gz
#wget ftp://ftp.gnu.org/gnu/ncurses/ncurses-5.9.tar.gz
#
#tar xvzf libevent-2.0.19-stable.tar.gz
#cd libevent-2.0.19-stable
#./configure --prefix=$HOME/local
#make
#make install
#cd ..

############
# ncurses  #
############
tar xvzf ncurses-5.9.tar.gz
cd ncurses-5.9
./configure --prefix=$HOME/local --without-cxx-binding
make
make install
cd ..

# There is this version
#tar xvzf tmux-${TMUX_VERSION}.tar.gz
#cd tmux-${TMUX_VERSION}
#./configure CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include" --prefix=$HOME/local
#CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses" LDFLAGS="-static -L$HOME/local/include -L$HOME/local/include/ncurses -L$HOME/local/lib" make && make install

git clone https://github.com/seebi/tmux-colors-solarized.git
cat tmuxcolors-256.conf >> ~/.tmux.conf

./configure\
    CFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses"\
    LDFLAGS="-L$HOME/local/lib -L$HOME/local/include/ncurses -L$HOME/local/include"\
    CPPFLAGS="-I$HOME/local/include -I$HOME/local/include/ncurses"\
    --with-features=huge\
    --enable-multibyte\
    --enable-rubyinterp\
    --enable-python3interp\
    --enable-perlinterp\
    --enable-cscope
    --with-python-config-dir=$HOME/local/lib/python3.5/config-3.5m\
    --prefix=$HOME/local\

$make && make install

# Python and python libraries
# ---------------------------
cd "${BASEDIR}"
wget https://www.python.org/ftp/python/3.5.1/Python-3.5.1.tgz --no-check-certificate
tar -zxvf Python-3.5.1.tgz
cd "${BASEDIR}"/Python-3.5.1
 ./configure --prefix=$HOME/local --with-ensurepip=install --enable-shared
make && make install
rm -rf "${BASEDIR}"/Python*
cd $HOME/local/bin
ln -s python3.5 python
ln -s pip3.5 pip

sudo apt-get install sqlite3 libsqlite3-dev 

pip install --ignore-installed --install-option="--prefix=$PREFDIR" South
pip install --ignore-installed --install-option="--prefix=$PREFDIR" django
pip install --ignore-installed --install-option="--prefix=$PREFDIR" flake8
pip install --ignore-installed --install-option="--prefix=$PREFDIR" gnureadline
pip install --ignore-installed --install-option="--prefix=$PREFDIR" ipython
pip install --ignore-installed --install-option="--prefix=$PREFDIR" nose
pip install --ignore-installed --install-option="--prefix=$PREFDIR" paramiko
pip install --ignore-installed --install-option="--prefix=$PREFDIR" pep8
pip install --ignore-installed --install-option="--prefix=$PREFDIR" pyflakes
pip install --ignore-installed --install-option="--prefix=$PREFDIR" pylint
pip install --ignore-installed --install-option="--prefix=$PREFDIR" python-termstyle
pip install --ignore-installed --install-option="--prefix=$PREFDIR" pytz
pip install --ignore-installed --install-option="--prefix=$PREFDIR" setuptools
pip install --ignore-installed --install-option="--prefix=$PREFDIR" sniffer
pip install --ignore-installed --install-option="--prefix=$PREFDIR" supervisor
pip install --ignore-installed --install-option="--prefix=$PREFDIR" virtualenv
pip install --ignore-installed --install-option="--prefix=$PREFDIR" setuptools
pip install --ignore-installed --install-option="--prefix=$PREFDIR" wsgiref
pip install --ignore-installed --install-option="--prefix=$PREFDIR" psutil
pip install --ignore-installed --install-option="--prefix=$PREFDIR" jedi
pip install --ignore-installed --install-option="--prefix=$HOME/local" MacFSEvents
pip install --ignore-installed --install-option="--prefix=$HOME/local" beautifulsoup4

# Powerline
pip install --ignore-installed --install-option="--prefix=$PREFDIR" powerline-status
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf --no-check-certificate
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf --no-check-certificate

mv PowerlineSymbols.otf ~/.fonts/
mv 10-powerline-symbols.conf ~/.config/fontconfig/conf.d/
fc-cache -vf ~/.fonts/

git clone https://github.com/vim/vim.git
./configure --with-features=huge --enable-python3interp --enable-perlinterp --without-x --disable-gui --disable-darwin --prefix=$HOME/local
make && make install
rm -rf "${BASEDIR}"/vim

# Install dotbot submodule
mkdir $HOME/dotfiles
cd $HOME/dotfiles
git submodule add http://github.com/anishathalye/dotbot

# Install zsh submodule
cd $HOME/dotfiles
git submodule add http://github.com/robbyrussell/oh-my-zsh.git zsh
cp $HOME/dotfiles/zsh/templates/zshrc.zsh-template ~/.zshrc

# Install vi submodules
cd $HOME/dotfiles/vim/bundle
for f in $(cat $HOME/dotfiles/gitmodules | grep url | grep -v dotbot | grep -v oh | awk -F = '{ print $2 }')
   do  git submodule add https://github.com/sjl/gundo.vim.git
 done

# Perl
wget http://www.cpan.org/src/5.0/perl-5.20.2.tar.gz
tar zxvf perl-5.20.2.tar.gz
cd perl-5.20.2
./Configure -des -Dprefix=$HOME/local
make
make test
make install

mkdir -pv $HOME/.certs
cd $HOME/.certs
touch Thawte_Premium_Server_CA.pem
touch Equifax_Secure_CA.pem
wget --no-check-certificate \
           https://github.com/bagder/curl/raw/master/lib/mk-ca-bundle.pl
perl mk-ca-bundle.pl

perl Makefile.PL PREFIX=$HOME/local/lib LIB=$HOME/local/lib
