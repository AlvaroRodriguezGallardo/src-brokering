import argparse
import os
# Constants that represents params we use for wsclean or other library

# Param: Number of CPUs
CPU_LIMIT = "cpulimit"
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

# Constans that relate parameters
IM_SIZE_SCALE_MAX = 10      # +=1, from 2 to 10, relates imsize with scale
AUTO_MASK_C = 2             # +=2, to 40
AUTO_THRESHOLD_C = 0.05  # += 0.05, to 1.0
N_ITER = 100    # No more
CHANNELS_OUT=8  # +=2 to 16

#------------------------------------------------------ INPUT ----------------------------------------------------------------------

def readFlags():    
    parser = argparse.ArgumentParser(description='Procesar los argumentos para generacion_ordenes_wsclean.')

    parser.add_argument('-l', '--library', type=str, help='Biblio name (optional)', required=False)
    parser.add_argument('-s', '--sif_file', type=str, help='.sif file', required=True)
    parser.add_argument('-i', '--image', type=str, help='Image', required=True)
    parser.add_argument('-m', '--ms_file', type=str, help='.ms file', required=True)

    args = parser.parse_args()

    library = args.library
    sif_file = args.sif_file
    image = args.image
    ms_file = args.ms_file

    return library,sif_file,image,ms_file

#------------------------------------------------------ WRITING ----------------------------------------------------------------------

def writingWithinFile(file,order):
    file.write(f"echo 'Executing: {order}' >> results.txt\n")
    file.write(f"start_time=$(date +%s)\n")
    file.write(f"energy_start=$(energy_measure --start)\n")
    file.write(f"{order}\n")
    file.write(f"energy_end=$(energy_measure --end)\n")
    file.write(f"end_time=$(date +%s)\n")
    file.write(f"echo 'Time taken: $(($end_time - $start_time)) seconds' >> results.txt\n")
    file.write(f"echo 'Energy consumed: $(($energy_end - $energy_start)) units' >> results.txt\n")
    file.write("echo '---' >> results.txt\n\n")

#------------------------------------------------------ CHANGING PARAMS ----------------------------------------------------------------------



#------------------------------------------------------ MAIN ----------------------------------------------------------------------


# INPUT: "python generacion_ordenes_wsclean.py -l <library> -s <.sif file> -i <image> -m <.ms file>. By default, library==wsclean "
if __name__ == '__main__':
    library,sif_file,image,ms_file = readFlags()
    if library == None:
        library = "wsclean"

    print(f"Library: {library}")
    print(f".sif file: {sif_file}")
    print(f"Image: {image}")
    print(f".ms file: {ms_file}")

    with open("orders.sh","w") as file:
        file.write("#!/bin/bash\n\n")
        file.write("# Starting executions. Results in results.txt\n")
        file.write(f"echo 'Results of {library} orders' > results.txt\n\n")

        changingImSizeScale(file,library,sif_file,image,ms_file)
        changingAutoMask(file,library,sif_file,image,ms_file)
        changingAutoThreshold(file,library,sif_file,image,ms_file)
        changingChannelsOut(file,library,sif_file,image,ms_file)

    # Executable script
    os.chmod("orders.sh",Oo755)
