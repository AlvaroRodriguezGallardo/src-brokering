from platypus import NSGAII, DTLZ2
import logging

# set log level so all messages are displayed
logging.basicConfig(level=logging.DEBUG)

# define the problem definition
problem = DTLZ2()

# instantiate the optimization algorithm
algorithm = NSGAII(problem)

# optimize the problem using 10,000 function evaluations
algorithm.run(10000)

# display the results
for solution in algorithm.result:
    print(solution.objectives)
