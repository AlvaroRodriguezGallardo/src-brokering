

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
# Param -name--> Hera we have an image
NAME = "-name"


# INPUT: "python generacion_ordenes_wsclean.py <library> <.sif file> <image> <.ms file>. By default, library==wsclean "
if __name__ == '__main__':
