import argparse
import os
import math
# Constants that represents params we use for wsclean or other library

# Param: Number of CPUs
CPU_LIMIT = "-j"  # \in {1,2,3,4} By default 1
# Where we should find a .sif file
BIND = "--bind"
# Library we want to use. By default, LIBRARY="wsclean"
LIBRARY="wsclean"
# Param -mgain
MGAIN = "-mgain"
# Param -gain
GAIN = "-gain"
# Param -niter--> Number of iterations
NITER = "-niter"
# Param -log-time
LOG_TIME = "-log-time"
# Param -auto-mask
AUTO_MASK = "-auto-mask"
# Param -auto-threshold
AUTO_THRESHOLD = "-auto-threshold"
# Param -local-rms
LOCAL_RMS = "-local-rms"
# Param -channels-out
CHANNELS_OUT = "-channels-out"
# Param -join-channels
JOIN_CHANNELS = "-join-channels"
# Param -weight
WEIGHT = "-weight"
# Param briggs
BRIGGS = "briggs"
# Param -scale
SCALE = "-scale"
# Param -size--> (x,y)
SIZE = "-size"
# Param -multiscale
MULTISCALE = "-multiscale"
# Param -multiscale-scales--> list of numbers
MULTISCALE_SCALES = "-multiscale-scales"
# Param -multiscale-scale-bias
MULTISCALE_SCALE_BIAS = "-multiscale-scale-bias"
# Param -name--> Here we have an image
NAME = "-name"

FITS_MASK = "-fits-mask"

# Constans that relate parameters
CPU_MAX = 4
IM_SIZE_SCALE_MAX = 10      # imsize+=1, imsize \in {2,..10}, by default 8, relates imsize with scale
AUTO_MASK_C_M = 8            # auto_mask+=1, auto_maks \in {3,..8}, by default 5
AUTO_THRESHOLD_C_M = 3  # aut+= 0.1, to 3.0, by default 3 (CONDITION: auto_threshold < auto_mask)
#N_ITER_MAX = 100    # niter \in {1000,2000,5000,20000}
CHANNELS_OUT_M=16  # channels_out+=2, channels_out \in {4,..,16}, by default 8

DEFAULT_CPU = 1
DEFAULT_IMSIZE = 1280
DEFAULT_SCALE = 8
DEFAULT_AUTO_MASK = 5
DEFAULT_AUTO_THRESHOLD = 3
DEFAULT_CHANNELS_OUT = 8
N_ITERS = [1000,2000,5000,20000]
#------------------------------------------------------ INPUT ----------------------------------------------------------------------

def readFlags():    
    parser = argparse.ArgumentParser(description='Procesar los argumentos para generacion_ordenes_wsclean.')

    parser.add_argument('-l', '--library', type=str, help='Biblio name (optional)', required=False)
    parser.add_argument('-s', '--sif_file', type=str, help='.sif file', required=True)
    parser.add_argument('-i', '--image', type=str, help='Image', required=True)
    parser.add_argument('-m', '--ms_file', type=str, help='.ms file', required=True)
    parser.add_argument('-f', '--fits_file',type=str,help='.fits file',required=False)

    args = parser.parse_args()

    library = args.library
    sif_file = args.sif_file
    image = args.image
    fits_file = args.fits_file
    ms_file = args.ms_file

    return library,sif_file,image,fits_file,ms_file

#------------------------------------------------------ WRITING ----------------------------------------------------------------------

def writingWithinFile(file,order):
    file.write(f"echo 'Executing: {order}' >> results.txt\n")
    file.write(f"start_time=$(date +%s)\n")
    #file.write(f"energy_start=$(energy_measure --start)\n")
    file.write(f"{order}\n")
   # file.write(f"energy_end=$(energy_measure --end)\n")
    file.write(f"end_time=$(date +%s)\n")
    file.write(f"echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt\n")
  #  file.write(f"echo 'Energy consumed: $(($energy_end - $energy_start)) units' >> results.txt\n")
    file.write("echo '---' >> results.txt\n\n")

#------------------------------------------------------ AUX FUNCTIONS ----------------------------------------------------------------------

def createOrder(library,sif_file,image,fits_file,ms_file,n_cpu,nit,auto_mask,auto_threshold,channels_out,scale,imsize):
    return "singularity exec " + BIND + " /mnt:/mnt " + sif_file + " " + library+ " "+NITER + " " + str(nit) + " " + CPU_LIMIT + " " + str(n_cpu) + " "+ AUTO_MASK + " " + str(auto_mask) + " " + AUTO_THRESHOLD + " "+ str(auto_threshold) + " " + CHANNELS_OUT + " " + str(channels_out)+ " " + JOIN_CHANNELS + " " + SCALE + " " + str(scale) + "asec"+ " " + SIZE + " " + str(imsize) + " "+ str(imsize) + " " + FITS_MASK + " " + fits_file+ " " + NAME + " " + image + " " + ms_file
    


#------------------------------------------------------ CHANGING PARAMS ----------------------------------------------------------------------

def changingImSizeScale(file,library,sif_file,image,fits_file,ms_file):
    n_cpu = DEFAULT_CPU
    proportional_im_size = 2
    auto_mask = DEFAULT_AUTO_MASK
    auto_threshold = DEFAULT_AUTO_THRESHOLD
    channels_out = DEFAULT_CHANNELS_OUT
    order=""

    while True:
        if DEFAULT_IMSIZE/proportional_im_size < 1:
            break
        if math.trunc(DEFAULT_SCALE/proportional_im_size) == math.trunc(DEFAULT_IMSIZE*proportional_im_size):
            for nit in N_ITERS:
                order = createOrder(library,sif_file,image,fits_file,ms_file,n_cpu,nit,auto_mask,auto_threshold,channels_out,math.trunc(DEFAULT_SCALE/proportional_im_size),math.trunc(DEFAULT_IMSIZE*proportional_im_size))
                
                writingWithinFile(file,order)

        proportional_im_size = proportional_im_size+1


def changingAutoMask(file,library,sif_file,image,fits_file,ms_file):
    n_cpu = DEFAULT_CPU
    im_size = DEFAULT_IMSIZE
  #  auto_mask = 3
    scale = DEFAULT_SCALE
    auto_threshold = DEFAULT_AUTO_THRESHOLD
    channels_out = DEFAULT_CHANNELS_OUT
    order=""

    for auto_mask in range(3,AUTO_MASK_C_M+1,1):
        if auto_mask > auto_threshold:
            for nit in N_ITERS:
                order = createOrder(library,sif_file,image,fits_file,ms_file,n_cpu,nit,auto_mask,auto_threshold,channels_out,scale,im_size)

                writingWithinFile(file,order)


def changingAutoThreshold(file,library,sif_file,image,fits_file,ms_file):
    n_cpu = DEFAULT_CPU
    im_size = DEFAULT_IMSIZE
    auto_mask = DEFAULT_AUTO_MASK
    scale = DEFAULT_SCALE
    #auto_threshold = 0.1
    channels_out = DEFAULT_CHANNELS_OUT
    order=""

    auto_threshold_values = [x * 0.1 for x in range(int(AUTO_THRESHOLD_C_M / 0.1) + 1)]

    for auto_threshold in auto_threshold_values:
        if auto_mask > auto_threshold:
            for nit in N_ITERS:
                order = createOrder(library, sif_file, image, fits_file, ms_file, n_cpu, nit, auto_mask, auto_threshold, channels_out, scale, im_size)
                
                writingWithinFile(file, order)


def changingChannelsOut(file,library,sif_file,image,fits_file,ms_file):
    n_cpu = DEFAULT_CPU
    im_size = DEFAULT_IMSIZE
    auto_mask = DEFAULT_AUTO_MASK
    scale = DEFAULT_SCALE
    auto_threshold = DEFAULT_AUTO_THRESHOLD
    #channels_out = 4
    order=""

    for channels_out in range(4,CHANNELS_OUT_M,2):
        for nit in N_ITERS:
            order = createOrder(library,sif_file,image,fits_file,ms_file,n_cpu,nit,auto_mask,auto_threshold,channels_out,scale,im_size)

            writingWithinFile(file,order)

def changingCPUS(file,library,sif_file,image,fits_file,ms_file):
    # n_cpu = 1
    im_size = DEFAULT_IMSIZE
    auto_mask = DEFAULT_AUTO_MASK
    scale = DEFAULT_SCALE
    auto_threshold = DEFAULT_AUTO_THRESHOLD
    channels_out = DEFAULT_CHANNELS_OUT
    order=""

    for n_cpu in range(1,CPU_MAX+1):
        for nit in N_ITERS:
            order = createOrder(library,sif_file,image,fits_file,ms_file,n_cpu,nit,auto_mask,auto_threshold,channels_out,scale,im_size)

            writingWithinFile(file,order)

#------------------------------------------------------ MAIN ----------------------------------------------------------------------


# INPUT: "python generacion_ordenes_wsclean.py -l <library> -s <.sif file> -i <image> -f <.fits file> -m <.ms file>. By default, library==wsclean "
if __name__ == '__main__':
    library,sif_file,image,fits_file,ms_file = readFlags()
    if library == None:
        library = LIBRARY
    if fits_file == None:
        fits_file = ""

    print(f"Library: {library}")
    print(f".sif file: {sif_file}")
    print(f"Image: {image}")
    print(f"fits. file: {fits_file}")
    print(f".ms file: {ms_file}")

    with open("orders.sh","w") as file:
        file.write("#!/bin/bash\n\n")
        file.write("# Starting executions. Results in results.txt\n")
        file.write(f"echo 'Results of {library} orders' > results.txt\n\n")

        changingImSizeScale(file,library,sif_file,image,fits_file,ms_file)
        changingAutoMask(file,library,sif_file,image,fits_file,ms_file)
        changingAutoThreshold(file,library,sif_file,image,fits_file,ms_file)
        changingChannelsOut(file,library,sif_file,image,fits_file,ms_file)
        changingCPUS(file,library,sif_file,image,fits_file,ms_file)

    # Executable script
    os.chmod("orders.sh",0o755)
    print("Bash script was created successfully")
