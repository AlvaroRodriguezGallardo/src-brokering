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

Most of examples can be exposed. However, as in documentation appears, it may be helpful show a table with different categories of flags. Only that flags I consider most importants will be exposed:

### Summary table

| Category        | Flag              | Explanation                                  |
|------------------|---------------------|---------------------------------------------|
| General operations     | -j <_threads_> | Run a program in parallel with the indicated threads          |
|                  | -no-work-on-master |  Computación distribuida (MPI). It does not use the master thread. Helpful if resources are limited         |
|                  | -mem <percentage> | Limits how many memory can be used in %          |
|                 | -abs-mem <memory_limit> | The same as '-mem' but in GB          |
|                  | -verbose (-v) | Output gives more information          |
|                  | -log-time | Add date and hour of a running          |
|                  | -quiet | Only errors are given          |
|                  | -no-dirty | Do not save dirty image          |
|                  | -save-weights | Save weights used (deep learning algorithm?)          |
|                  | -apply-primary-beam | Calculate and apply the primary beam to an image. Then it is saved (``EveryBeam`` is needed)          |
|                  | --use-differential-lofar-beam | Visibilities must have been corrected with the beam. It determines if we can obtein some flux levels          |
|                  | -mwa-path <path> | Where MWA files can be found          |
|                  | -primary-beam-model | Specifies the beam model. Relevant for SKA         |
| Weighting options     | -weight <_weightmode_> |  It indicates the way weights are obtained:natural,uniform or briggs. If briggs is selected, add robustness parameter         |
|                  | -super-weight <-factor_>| Increase the weight gridding box size. Default: 1.0         |
|                  | -mf-weighting| In spectral mode, calculate the weights as if the image was made using MF. Useful for uniform or brigg modes         |
|                  | -no-mf-weighting| It disables the previous flag        |
|                  | -weighting-rank-filter <_level_> | Filter the weights and set up them if they are higher than <_level_>*local mean        |
|                  | -taper-gaussian <_beamsize_> | Calculate weights using the gaussian function (good properties, like symmetry)        |
|                  | -taper-edge <_lambda_> | Calculate weights using a distance of <_lambda_> as difference between edges and gridded visibilities        |
|                   |  -store-imaging-weights | Save used weights in a column called ``IMAGING_WEIGHT_SPECTRUM``|
| Inversion options     | -size <_width_> <_height_> | Size of the output image         |
|                   |  -padding <_factor_> |  Pad images by the given factor during inversion to avoid aliasing |
|                   |  -scale <pixel-scale> |  Scale for a pixel |
|                   |  -prediction |  Make a prediction for an image given |
|                    | -shift <ra> <dec> | Change the phase centre to another in the tangential plane|
|                  |  -nwlayers <nwlayers> | It indicates the number of w-layers |
|                  |  -grid-mode <"nn", "kb" or "rect"> | Kernel and mode used for gridding: kb = Kaiser-Bessel (default with 7 pixels), nn = nearest neighbour (no kernel) |
|                  |  -kernel-size <size>  | Size of the kernel. Default 7. Remember a kernel is a matrix with size nxn |
|                  |  -visibility-weighting-mode [normal/squared/unit] | Specify visibility weighting modi. Affects how the weights (normally) stored in ``WEIGHT_SPECTRUM`` column are applied. Useful for estimating errors |
|                  | -simulate-noise <_stddev-in-jy_> | Replaces every visibility with a gaussian value with standard desviation given |
|                  | -simulate-baseline-noise <_filename_> | The same as the previous flag, but the standard desviation is given within a file |
|                  | -idg-mode [cpu/gpu/hybrid]             | Set the IDG mode |
|                  |  -use-wgridder    |   Use the w-gridding gridder developed by Martin Reinecke |
| A-Term gridding     | -aterm-config <_filename_> | Set properties of a-aterm, giving the documentation needed|
|                  |  -grid-with-beam  |  Apply a-terms to correct for the primary beam. This is only possible when IDG is enabled  |
|                  |  -aterm-kernel-size <_double_>  |  Kernel size reserved for aterms by IDG |
|                  |  -apply-facet-solutions <path-to-file> <name1[,name2,...nameN]> | Apply solutions from the provided (h5 format) file per facet when gridding facet based images |
|                  |  -save-aterms  | Save a file for every aterm update |

More flags in ``wsclean --help``. **Specially interested in ``DATA SELECTION OPTIONS`` and ``DECONVOLUTION OPTIONS`` options**

During my learning process of wsclean, I have learned about the most important flags:

- size <_tamX_> <_tamY_>: we specify the size of outputs images.
- scale <_angle_>: Specifies the angle seen by our eye between the bottom of a single pixel and the top of the same pixel.
- niter <_iters_>: Stopped criteria. However, it is advisable to use the next flag for a real stopped criteria (this is for not having an eternal loop).
- auto-threshold <_sigma_>: When the peak flux arrives to 3*<_sigma_>, it stops.
- mgain <_percent_>: It reduces flux in a <percent> in each iteration.
- predict: Generally, it relates a image given with our dataset. It does not make a prediction with the correct frecuency, so you must be careful. [More information](https://wsclean.readthedocs.io/en/latest/prediction.html)
- weight <_mode_>: You specify how to get weightings. By default, there is established ``-weight uniform``. <_mode_> = uniform / natural / briggs <roubstness>
- gaussian-taper <_beamsize_>: Multiplies all weights using a gaussian function (good properties) and makes an approach to the beam using gaussiana function with <_beamsize_>.
- taper-tukey / taper-inner-tukey / taper-edge-tukey: Uses tukey transition.
- join-channels <_number_>: (<_number_> > 1) Useful for making image cubes. It specifies that information should be presented with <_number_> different frecuencies. In my opinion, it generates <_number_> images for making a cube with them later. If <_number_> is less than .ms frecuencies files inputs, it groups them calculating the average of consecutive <_number_> files frecuency, with "empty intersection" between them.
- weighting-rank-filter <_number_>: May prevent noise made by outlier weights, using <_number_> as the factor relative to the RMS above which the values are truncated.
- baseline-averaging <_nwavelengths_>: Specifies number of wavelengths allowed to average over.
- continue: WSClean will read the previous model and will use some .fits for generating more results.
- reuse-psf / reuse-dirty: If a previous execution was done, it reused dirty and psf files. With this action, we do not have to make inverse again, for example.
- use-idg.
- idg-mode [cpu/gpu/hybrid]: It specifies where program will run. *GPU MODE IS NOT RECOMMENDED, BETTER HYBRID IF COMPUTER HAS A GPU*.
- python-deconvolution <_script_>: It relates WSClean with a script programmed, but it needs to achieve this [specifications](https://wsclean.readthedocs.io/en/latest/python_deconvolution.html)

For distributed executions, use ``wsclean-mp´´ . However, you must use ``-join-channels`` flag, or it will not give a singe benefit.
  
### Conclusions
Summarizing all I wrote before, wsclean is a library used in Radio Astronomy, lika CASA, in which we can clean images (previously calibrated). In the next lines, I will try to relate it with the next step of the scholarship.

Firstly, we have to design and develop a wide range of wsclean versions: normal wsclean, distributed wsclean, wsclean with GPU, optimised wsclean,..., using a serverless platform like [OSCAR](https://oscar.grycap.net/). Imagine you want to use this software, then you run a command with a flag ``--version`` for example, where you specify which module you want to run. Developing must be optimised by the fact that this software must process a large amount of data (Terabytes, or more).

After knowing that our software system is already, and it is tested enough, we should introduce a broker, which has two objectives: first it has to interpret command introduced by user (or what a hypothetical workflow wants), actions like cleaning the image, convolutionate an image,... Then, it must know about our software system and make some decisions (we are in a classification problem). Depending what is being executed, free resources,..., it will send that dataset to being processed in a module in which time, or even resources, are optimised. It is proposed to use machine learning algorithms, but I have to think what is the best algorithm for an optimal decision: decision trees, regression models, deep neural networks,...
