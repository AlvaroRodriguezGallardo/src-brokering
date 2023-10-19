import cv2
import numpy as np
import sys
import os   # If path is a folder

# Check FSOURCE variable to decide if the whole folder or just a single file.
## Please refactor and review it.
def isAnImage(path_):
    _,extension = os.path.splitext(path_)
    extension = extension.lower()

    image_extensions = ['.jpg', '.jpeg', '.png', '.gif', '.bmp', '.tiff', '.svg']

    if extension in image_extensions:
        return True
    else:
        return False

def processImage(path_):
    image_aux = cv2.imread(path_)
    image = cv2.imread(path_,cv2.IMREAD_GRAYSCALE)

    face_borders = cv2.Canny(image,100,200)

    name,ext = os.path.splitext(path_)

    cv2.imwrite(name+'_edges'+ext,face_borders)
    cv2.imwrite(path_,image_aux)        # In other case, image is lost


def processFolder(path_):
    content = os.listdir(path_)

    for element in content:
        element_way = os.path.join(path_,element)
        if isAnImage(element_way):
            processImage(element_way)
        #if os.path.isdir(element_way):     # If it is supposed to have subfolders inside the folder in the argument
        #    processFolder(element_way)


if len(sys.argv)==2:
    argument = sys.argv[1]
    if os.path.isdir(argument):
        processFolder(argument)
    if isAnImage(argument):
        processImage(argument)

else:
    print("Please, introduce an argument (iamge or folder)")

