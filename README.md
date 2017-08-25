# test_scipypy

Script to install pypy, numpy, pandas, matplotlib, scipy, IPython and jupyter in your `$HOME` directory.

# Usage of the script

Open a terminal and in the terminal do the following:

    wget https://raw.githubusercontent.com/kikocorreoso/test_scipypy/master/install_scipypy.sh
    chmod +x install_scipypy.sh
    bash install_scipypy.sh
    
# Options of the script

By default it will install all the stuff in `$HOME/pypy` and it will use the latest pypy3 version. You can change this using:

* `-n` or `--name` to define the name of the folder where all will be installed

```
bash install_scipypy.sh -n my_pypy_folder # to install it in $HOME/my_pypy_folder
```

* `-p` or `--python` to define the pypy version to be installed. Use `2` to install the latest pypy compatible with CPython2.7 or `3` to install the latest pypy compatible with CPython 3.x.

```
bash install_scipypy.sh -p 2 # to install pypy2 (compatible with CPython2.7)
```

# Result

After running the script:

* a new folder will be created in your `$HOME` directory with a 64-bits portable pypy (Thanks to [Squeaky](https://github.com/squeaky-pl/portable-pypy)!!).

* a new path will be added to your `$PATH` modifying your `.bashrc`.

* a virtualenv will be created in your new folder called `pypyvenv` with NumPy, Matplotlib (\*), pandas, SciPy (\*), IPython and Jupyter.

(\*) Matplotlib and SciPy installation may fail if you do not have the necessary requirements in your system (freetype, libpng, BLAS, LAPACK,...)

WARNING: I have tested it only on a 64-bits debian based linux. If you find errors, please, open an [issue](https://github.com/kikocorreoso/test_pypy_numpypy/issues).

# Running `pypy`

`pypy` should be accesible for your user from a terminal:

    pypy

# Running `pypy` from the virtualenv

Open a terminal, go to the folder where the script have installed all the stuff and do the following:

    source ~/pypyvenv/bin/activate

Your prompt should be something like:

    (pypyvenv)tornado@tornado-machine:~$

To install new libraries in the virtualenv once is activated you could use:

    virtualenv-pypy install name_of_the_library_to_install

To deactivate the virtualenv just do:

    deactivate

# Uninstalling all

In case you want to undo the work made by the script just do the following:

* remove the folder where the portable pypy was installed

* And edit your *.bashrc* to remove the lines:

    # Added path to include pypy by user $USER
    export PATH=[...........]





