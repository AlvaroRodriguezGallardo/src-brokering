# Running Platypus, using NSGAII algorithm with DTLZ2 problem
# Using a object-oriented program. I think it is more readable
# Both type of problems: unconstrained and constrined.
# Vectorial field F:\Omega \to \R^j    \Omega \subset R^i, a parametration of a surface (first case a parable, second case S2)
# In the first one, i=1 and j=2. In the other example, i=2 and j=3
from platypus import NSGAII,DTLZ2,Problem,Real
import math
import matplotlib.pyplot as plt
import os
# Three classes: DTLZ2 problem, unconstrained problem and constrained problem

class unconstrainedProblem(Problem):

    def __init__(self):
        super().__init__(1,2)
        self.types[:] = Real(-10,10)

    def evaluate(self,solution):
        t = solution.variables[:]
        solution.objectives[:] = [t[0],t[0]**2]

class constrainedProblem(Problem):

    def __init__(self):
        super().__init__(2,3,2) # Number of constraints equals i?
        self.types[:] = {Real(0,2*math.pi),Real(0,math.pi)}
        self.constraints[:] = "<=0"

    def evaluate(self,solution):
        x = solution.variables[0]
        y = solution.variables[1]
        solution.objectives = [x,y,x**2 + y**2]
        solution.constraints[:] = [-x+y-1,x+y-7]


def storagingFile(my_result, dimension, file_name, folder_name='Results/'):
    if not os.path.exists(folder_name):
        os.makedirs(folder_name)

    if dimension == 2:
        plt.scatter([s.objectives[0] for s in my_result], [s.objectives[1] for s in my_result])
        plt.title('Pareto domain')
        plt.xlabel('Objective 1')
        plt.ylabel('Objective 2')
    elif dimension == 3:
        from mpl_toolkits.mplot3d import Axes3D
        fig = plt.figure()
        ax = fig.add_subplot(111, projection='3d')
        ax.scatter([s.objectives[0] for s in my_result], [s.objectives[1] for s in my_result], [s.objectives[2] for s in my_result])
        ax.set_xlabel('Objective 1')
        ax.set_ylabel('Objective 2')
        ax.set_zlabel('Objective 3')

    storaging_route = os.path.join(folder_name, file_name)
    plt.savefig(storaging_route)
    plt.clf()


def executingDTLZ2():
    my_problem = DTLZ2()
    my_algorithm = NSGAII(my_problem)
    my_algorithm.run(10000)

    storaging_route(my_algorithm.result(),2,'dtlz2.jpg')

    for solution in my_algorithm.result():
        print(solution.objectives)

def executingUnconstrainedProblem():
    my_algorithm = NSGAII(unconstrainedProblem())
    my_algorithm.run(10000)

    storaging_route(my_algorithm.result(),2,'unconstrained.jpg')

    for solution in my_algorithm.result():
        print(solution.objectives)

def executingConstrainedProblem():
    my_algorithm = NSGAII(constrainedProblem())
    my_algorithm.run(10000)

    storaging_route(my_algorithm.result(),3,'constrained.jpg')

    for solution in my_algorithm.result():
        print(solution.objectives)





if __main__ == '__main__':
    print("------------------------------------------------------------   DTLZ2 PROBLEM WITH NSGAII ALGORITHM   ------------------------------------------------------------------------------")
    executingDTLZ2()
    print("------------------------------------------------------------*****************************************------------------------------------------------------------------------------")
    print("-----------------------------------------------------------   UNCONSTRAINED PROBLEM. SURFACE=PARABLE   ------------------------------------------------------------------------------")
    executingUnconstrainedProblem()
    print("------------------------------------------------------------*****************************************------------------------------------------------------------------------------")
    print("------------------------------------------------------------   CONSTRAINED PROBLEM. SURFACE=S2  ------------------------------------------------------------------------------")
    executingConstrainedProblem()
    print("------------------------------------------------------------*****************************************------------------------------------------------------------------------------")

