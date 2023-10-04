import cv2
import numpy as np
import sys

# Check FSOURCE variable to decide if the whole folder or just a single file.
## Please refactor and review it.

# The image is read, and it is in the same work directory
image = cv2.imread('images/'+sys.argv[1],cv2.IMREAD_GRAYSCALE)


# Canny's algorithm implemented in OpenCV is used for borders detection
face_borders = cv2.Canny(image,100,200)


cv2.imwrite('images/edge_detection_' + str() + '.jpg',face_borders)
