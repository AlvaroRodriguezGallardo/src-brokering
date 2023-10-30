# Learning about wsclean: library for tratement of radioastronomy images
## Instalation:
Exploring two ways in Ubuntu:
-  With ``sudo apt install wsclean``. It downloads wsclean in version 3.0. Maybe wsclean version is not new enough.
-  Manually, following steps in [wsclean](https://wsclean.readthedocs.io/en/latest/installation.html). First, clone the repository with ``git clone -b master git@gitlab.com:aroffringa/wsclean.git``. Then, install all dependencies as the web indicates, like Casacore, fftw,... -->If HDF5 causes troubles, you will need to restart your terminal, then continuous normally. Generally, if all dependencies are satisfied, you must run the following comands:
``` 
mkdir -p build
cd build
cmake ../
make -j 4
sudo make install
```
