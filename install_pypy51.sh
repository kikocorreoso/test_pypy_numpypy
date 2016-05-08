# ADD PYPY, PIP, NUMPYPY AND JUPYTER TO YOUR USER IN A VIRTUALENV

# Create a directory to download pypy-portable
# Thanks squeaky!!
mkdir $HOME/pypy51

# Create a /bin directory at your home to add pypy for your user
mkdir $HOME/bin

# Download pypy-portable 5.1
cd $HOME/pypy51
if [ $1 -eq 32 ]
then
  # Download pypy-portable 5.1
  wget https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-5.1.1-linux_i686-portable.tar.bz2
  # unzip/untar the downloaded file
  tar xvfj pypy-5.1.1-linux_i686-portable.tar.bz2
  # Create a symbolic link at your new /bin directory
  ln -s $HOME/pypy51/pypy-5.1.1-linux_i686-portable/bin/pypy $HOME/bin
  # Change permissions to pypy executable
  chmod +x $HOME/pypy51/pypy-5.1.1-linux_i686-portable/bin/pypy
else
  # Download pypy-portable 5.1
  wget https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-5.1.1-linux_x86_64-portable.tar.bz2
  # unzip/untar the downloaded file
  tar xvfj pypy-5.1.1-linux_x86_64-portable.tar.bz2
  # Create a symbolic link at your new /bin directory
  ln -s $HOME/pypy51/pypy-5.1.1-linux_x86_64-portable/bin/pypy $HOME/bin
  # Change permissions to pypy executable
  chmod +x $HOME/pypy51/pypy-5.1.1-linux_x86_64-portable/bin/pypy
fi

# add your new /bin directory to the PATH in your .bashrc file
echo "" >> $HOME/.bashrc
echo "# Added path to include pypy by $USER" >> $HOME/.bashrc
echo "export PATH=$PATH:$HOME/bin" >> $HOME/.bashrc
source $HOME/.bashrc

# Create a virtualenv on your new /bin directory
virtualenv -p pypy $HOME/bin/pypyvenv

# Install numpypy using pip from the new virtualenv
$HOME/bin/pypyvenv/bin/pip install git+https://bitbucket.org/pypy/numpy.git

# Install IPython/Jupyter
$HOME/bin/pypyvenv/bin/pip install jupyter

# Remove the downloaded pypy*.tar-bz2 file
rm $HOME/pypy51/pypy*.tar.bz2
