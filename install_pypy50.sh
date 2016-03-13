# ADD PYPY, PIP, NUMPYPY AND JUPYTER TO YOUR USER IN A VIRTUALENV

# Create a directory to download pypy-portable
# Thanks squeaky!!
mkdir $HOME/pypy50

# Download pypy-portable 5.0
cd $HOME/pypy50
wget https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-5.0-linux_x86_64-portable.tar.bz2

# unzip/untar the downloaded file
tar xvfj pypy-5.0-linux_x86_64-portable.tar.bz2

# Create a /bin directory at your home to add pypy for your user
mkdir $HOME/bin

# Create a symbolic link at your new /bin directory
ln -s $HOME/pypy50/pypy-5.0-linux_x86_64-portable/bin/pypy $HOME/bin

# Change permissions to pypy executable
chmod +x $HOME/pypy50/pypy-5.0-linux_x86_64-portable/bin/pypy

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
rm $HOME/pypy50/pypy*.tar.bz2
