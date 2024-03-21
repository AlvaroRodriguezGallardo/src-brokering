# In this program, I will try to make an interpolation function, given both, a random n-dimensional vector and a random m-dimensional vector.

import random
import numpy as np
from scipy.interpolate import NearestNDInterpolator

# We create both vectors, with size <total>. Then input arrays is n-dimensional (\subset \mathbb{R^n}) array and the same with output.
# In position i \in [0,total-1], we have the correspondence input_i --> output_i
def randomInputOutput(n,m,total):
    ninput = np.zeros((total,n),dtype=float)
    output = np.zeros((total,m),dtype=float)

    # Firstly we create a random n-dimensional vector for input
    for i in range(total):
        aux = np.zeros(n,dtype=float)
        for j in range(n):
            aux[j] = random.random()
        
        ninput[i] = aux

    for i in range(total):
        aux = np.zeros(m,dtype=float)
        for j in range(m):
            aux[j] = random.random()
        
        output[i] = aux

    return ninput, output

# If I want a linear interpolation
# It returns a function, F. We can do F(new_value)
def createInterpolationFunctionNearest(ninput,output):
    return NearestNDInterpolator(ninput, output)

# Given an input and an output, interpolation function is create with interp1d
# It returns a grid. If it is labelled by F, you should do res = griddata(input,output,new_value,method=method)

if __name__ == '__main__':
    print("INPERPOLATION F:R^n --> R^m")
    n=int(input("Choose n of R^n: "))
    m = int(input("Choose m of R^m: "))
    total = int(input("Which size should sample be?: "))
    ninput,output = randomInputOutput(n,m,total)
    print("Random values for interpolation are: ")
    print(ninput)
    print("---------")
    print(output)
    print("---------")
    print("Making the interpolation function")
    F = createInterpolationFunctionNearest(ninput,output)
    print("---------")
    finish = 0
    while(finish != 1):
        point = np.zeros((1, n), dtype=float)
        for i in range(n):
            number = float(input("Introduce coordinate " + str(i + 1) + ": "))
            point[0, i] = number

        print("It returns value "+str(F(point)))

        finish = int(input("Do you want to finish: 1=yes, 0=no: "))

