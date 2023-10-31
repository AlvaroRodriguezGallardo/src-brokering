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
## Running commands:
You can follow [this steps](https://wsclean.readthedocs.io/en/latest/usage.html) for simple examples. You need get some .ms files for a succesful run. With ``wsclean --help`` you can look for a wide amount of flags.

### Examples:

- ``wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms``: It runs the Cotton-Schwab algorithm, with the following parameters: ``-size`` returns an image with the specificated size, ``-mgain`` indicates the percentage the peak flux is reduced, ``-niter`` is the maximum iterations done by the algorithm, ``-auto-threshold`` stimate noise level with a given typical desviaton, and ``-scale``, indicates the scale of a pixel.
- ``wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -auto-threshold 3 -padding 1 obs.ms``: Here, ``-padding`` is factor with which you pad the image.

Most of examples can be exposed. However, as in documentation appears, it may be helpful show a table with different categories of flags.

### Summary table

| Categoría        | Flag              | Explicación                                  |
|------------------|---------------------|---------------------------------------------|
| Categoría 1     | Nombre de la cosa 1 | Explicación detallada de la cosa 1          |
|                  | Nombre de la cosa 2 | Explicación detallada de la cosa 2          |
| Categoría 2     | Nombre de la cosa 3 | Explicación detallada de la cosa 3          |
|                 | Nombre de la cosa 4 | Explicación detallada de la cosa 4          |
| Categoría 3     | Nombre de la cosa 5 | Explicación detallada de la cosa 5          |
