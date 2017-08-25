# ADD PYPY, PIP, NUMPY, MATPLOTLIB, PANDAS, SCIPY, IPYTHON AND JUPYTER TO YOUR USER IN A VIRTUALENV

# Options

# default
FOLDER_NAME=pypy
PYVERSION=3

while [[ $# -gt 1 ]]
do
key="$1"

case $key in
    -n|--name)
    FOLDER_NAME="$2"
    shift # past argument
    ;;
    -p|--python)
    PYVERSION="$2"
    shift # past argument
    ;;
    *)
    echo "Unknown options."        # unknown option
    echo "Valid options are:"
    echo "  -n, --name: Name of the folder where pypy and virtualenv will be installed."
    echo "    e.g., -n myfolder, will install all in /home/youruser/myfolder."
    echo "    If you do not define this option default value is $HOME/pypy."
    echo "  -p, --python: Python version to be installed."
    echo "    e.g., -p 3, will install latest (portable) pypy3 version."
    echo "    valid options are 2, for pypy (CPython 2.7) or 3 for latest pypy3 version."
    echo "    If you do not define this option default value is 3."
    exit
    ;;
esac
shift # past argument or value
done

# Create a directory to download pypy-portable
# Thanks squeaky!!
mkdir -p $HOME/$FOLDER_NAME/portable_pypy

# Download pypy-portable and add it to PATH
cd $HOME/$FOLDER_NAME/portable_pypy
if [ $PYVERSION -eq 2 ]
then
  # Download pypy-portable 2.7
  wget https://bitbucket.org/squeaky/portable-pypy/downloads/pypy-5.8-1-linux_x86_64-portable.tar.bz2
  # unzip/untar the downloaded file
  tar xvfj pypy-5.8-1-linux_x86_64-portable.tar.bz2
  rm pypy-5.8-1-linux_x86_64-portable.tar.bz2
  # Change permissions to pypy executable
  chmod +x $HOME/$FOLDER_NAME/portable_pypy/pypy*linux_x86_64-portable/bin/pypy
  # Change permissions to virtualenv-pypy executable
  chmod +x $HOME/$FOLDER_NAME/portable_pypy/pypy*linux_x86_64-portable/bin/virtualenv-pypy
  # add your new /bin directory to the PATH in your .bashrc file
  cd pypy*linux_x86_64-portable/bin
  BINPATH=$(pwd)
elif [ $PYVERSION -eq 3 ]
then
  # Download pypy-portable 3.5
  wget https://bitbucket.org/squeaky/portable-pypy/downloads/pypy3.5-5.8-1-beta-linux_x86_64-portable.tar.bz2
  # unzip/untar the downloaded file
  tar xvfj pypy3.5-5.8-1-beta-linux_x86_64-portable.tar.bz2
  rm pypy3.5-5.8-1-beta-linux_x86_64-portable.tar.bz2
  # Change permissions to pypy executable
  chmod +x $HOME/$FOLDER_NAME/portable_pypy/pypy*linux_x86_64-portable/bin/pypy
  # Change permissions to virtualenv-pypy executable
  chmod +x $HOME/$FOLDER_NAME/portable_pypy/pypy*linux_x86_64-portable/bin/virtualenv-pypy
  # add your new /bin directory to the PATH in your .bashrc file
  cd pypy*linux_x86_64-portable/bin
  BINPATH=$(pwd)
else
  echo "Unknown option for -p or --python, valid options for python are 2 or 3."
fi

echo "Installed pypy and added to PATH"
echo ""
echo ""
echo ""
echo ""
echo "" >> $HOME/.bashrc
echo "# Added path to include pypy by user $USER" >> $HOME/.bashrc
echo "export PATH=$PATH:$BINPATH" >> $HOME/.bashrc
source $HOME/.bashrc

# Create a virtualenv on your new /bin directory
virtualenv-pypy $HOME/$FOLDER_NAME/pypyvenv

# Install numpy using pip from the new virtualenv
$HOME/$FOLDER_NAME/pypyvenv/bin/pip install numpy

# Install matplotlib using pip from the new virtualenv
# As it need to install some system dependencies for now it is not installed
#$HOME/$FOLDER_NAME/pypyvenv/bin/pip install matplotlib

# Install pandas using pip from the new virtualenv
$HOME/$FOLDER_NAME/pypyvenv/bin/pip install pandas

# Install scipy using pip from the new virtualenv
$HOME/$FOLDER_NAME/pypyvenv/bin/pip install scipy

# Install IPython/Jupyter
$HOME/$FOLDER_NAME/pypyvenv/bin/pip install jupyter
