import cv2
import numpy as np

# The image is read, and it is in the same work directory
image = cv2.imread('images/perro_husky.jpg',cv2.IMREAD_GRAYSCALE)
print("aaaa")
# Canny's algorithm implemented in OpenCV is used for borders detection
face_borders = cv2.Canny(image,100,200)

#cv2.imshow('Borders detection', face_borders)

cv2.imwrite('images/bordes.jpg',face_borders)

#cv2.waitKey(0)
#cv2.destroyAllWindows()
