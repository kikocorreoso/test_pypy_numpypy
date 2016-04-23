# test_pypy_numpypy
Script to install pypy, numpypy and jupyter in your **$HOME** directory.

# Requirements

* virtualenv (tested with python 3.5 and virtualenv 13.0.1)
* git

# Usage of the script

Open a terminal and in the terminal do the following:

(In case you want to test pypy 5.0)

    wget https://raw.githubusercontent.com/kikocorreoso/test_pypy_numpypy/master/install_pypy50.sh
    chmod +x install_pypy50.sh
    bash install_pypy50.sh

(In case you want to test pypy 5.1)


    wget https://raw.githubusercontent.com/kikocorreoso/test_pypy_numpypy/master/install_pypy51.sh
    chmod +x install_pypy51.sh
    bash install_pypy51.sh

This will create a **pypy50** or **pypy51** folder, depending what you have chosen to install, with a 64-bits portable pypy (Thanks to [Squeaky](https://github.com/squeaky-pl/portable-pypy)!!).

On the third line you can pass an argument specifying if you want the 32 or 64 bits version to be installed, e.g., to install the 32 bits version do:

    bash install_pypy51.sh 32

By default, if you do not specify an argument it installs the 64 bits version.

WARNING: I have tested it only on a 64-bits debian based linux. If you find errors, please, open an [issue](https://github.com/kikocorreoso/test_pypy_numpypy/issues).

After creating the **pypy5X** folder it will add some commands to your **.bashrc** that will add a pypy executable to the path. The new pypy 
executable will be created in a new **bin** folder created at your **$HOME**.

After that, `virtualenv` will create a new virtualenv called **pypyvenv** in the recently created **bin** directory and it will install *numpypy* (here it needs *git*) and *jupyter* with all its dependencies.

# Running `pypy`

`pypy` should be accesible for your user from a terminal:

    pypy

# Running `pypy`, `numpypy` and `jupyter` from the virtualenv

Open a terminal and do the following:

    . ~/bin/pypyvenv/bin/activate

Your prompt should be something like:

    (pypyvenv)tornado@tornado-machine:~$

To run `jupyter`:

    jupyter notebook

To deactivate the virtualenv just do:

    deactivate

# Uninstalling all

In case you want to undo the work made by the script just do the following:

    rm  ~/bin/pypy
    rm -fr ~/bin/pypyvenv/

and remove the folder where the portable pypy is that should be named **pypy50** or **pypy51** depending if you installed 
pypy 5.0 or pypy 5.1, respectively:

    rm -fr ~/pypy50

or

    rm -fr ~/pypy51

And edit your *.bashrc* to remove the lines:

    # Added path to include pypy by tornado
    export PATH=[...........]





