import cv2
import numpy as np
import sys
import os   # If path is a folder
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')     # In future operations, the minimum level of logging is 'info'


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

    logging.info("The representation of the image in a gray scale is\n")
    logging.info(image)

    face_borders = cv2.Canny(image,100,200)
    name,ext = os.path.splitext(path_)

    logging.info("The representation of the edges images is\n")
    logging.info(face_borders)
    cv2.imwrite(name+'_edges'+ext,face_borders)
    logging.info(path_+" has been transformated into "+name+"_edges")
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
    logging.info("The last argument is "+str(argument))
    if os.path.isdir(argument):
        logging.info("It is a folder")
        processFolder(argument)
    if isAnImage(argument):
        logging.info("It is an image")
        processImage(argument)
else:
    print("Please, introduce an argument (iamge or folder)")
