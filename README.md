# test_pypy_numpypy
Script to install pypy, numpypy and jupyter in your **$HOME** directory.

Tested only on a 64-bits debian based linux. If you find errors, please, open an [issue](https://github.com/kikocorreoso/test_pypy_numpypy/issues).

# Requirements

* virtualenv (tested with python 3.5 and virtualenv 13.0.1)
* git

# Usage of the script

Open a terminal and in the terminal do the following:

    wget https://raw.githubusercontent.com/kikocorreoso/test_pypy_numpypy/master/install_pypy50.sh
    chmod +x install_pypy50.sh
    bash install_pypy50.sh

This will create a **pypy50** folder with a 64-bits portable pypy (Thanks to [Squeaky](https://github.com/squeaky-pl/portable-pypy)!!).

It will add some commands to your **.bashrc** that will add a pypy executable to the path. The new pypy 
executable will be created in a new **bin** folder created at your **$HOME**.

After that, `virtualenv` will create a new virtualenv called **pypyvenv** in the recently created **bin** directory and it will intall *numpypy* (here it needs *git*) and *jupyter* with all its dependencies.

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
