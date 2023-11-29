from platypus import NSGAIII, DTLZ2


class MOEAforbroker(Problem):
    def __init__(self, N_functions,P_decision_var):
        # I establish objectives number (N functions) and how many decision variables there are
        super(MOEAforbroker,self).__init__(N_functions,P_decision_var)

        # I define decision variables limits. Between 0 and 1. Near to 1 is a good option in the execution planning
        self.types[:] = [Real(0,1)]*N_functions

        # What do I want to? --> A minimization problem
        self.directions[:] = [self.MINIMIZE] * N_functions

    def evaluate(self,solution):
        # I get values of decision variables
        values = solution.variables

        # Evaluation function is used to evaluate execution planning given
        objective_values = evaluate_function(values)

        #  I put my objectives values in an array. They are values I want to minimise (?)
        solution.objectives[:] = objective_values


# Evaluation function
# Some variables are needed for MOEA. 'values' is a dictionary with next fields:
#   - CPU cores: How many cores are needed within proposed solution with CPU?  --> CPU is basical case--> int
#   - GPU cores: How many cores are needed if it uses GPU? ---> int
#   - use_ARM: Do I need ARM? --> True/False
#   - get_data_other_nodes: Do I need data from different nodes? ---> List
#   - node_load: Which is node_load in the last x days?--> float \in [0,1] 
# Evaluation function receives a dictionary 'solution' which is the proposed one to the algorithm

def evaluate_function(values):
    cpu_cores = values["cpu_cores"]                         # int
    gpu_cores = values["gpu_cores"]                         # int. If gpu_cores==0, then it is supposed GPU is not needed
    use_arm = values["use_arm"]                             # boolean
    get_data_other_nodes = values["get_data_other_nodes"]   # List<int>. If get_data_other_nodes.is_empty(), then it is supposed all needed data is within the node
    node_load = values["node_load"]                         # Float \in [0,1]

    assert cpu_cores>0, "Specify how many cores you want to run in CPU"
    assert 0.0<=node_load<=1.0, "node_load must be a float between 0.0 and 1.0"

    t_execution_planning = getExecutionTimePlanning(cpu_cores=cpu_cores,gpu_cores=gpu_cores,use_arm=use_arm,get_data_other_nodes=get_data_other_nodes,node_load=node_load)
    energy_consumption = getEnergyConsumptionPlanning(cpu_cores=cpu_cores,gpu_cores=gpu_cores,use_arm=use_arm,get_data_other_nodes=get_data_other_nodes,node_load=node_load)

    return t_execution_planning,energy_consumption

# In this problem, it is supposed VARIABLES ARE INDEPENDENT, EVEN IF SOME SOLUTIONS CONSIDER THEM AS RANDOM VARIABLES

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getExecutionTimePlanning(cpu_cores,gpu_cores,use_arm,get_data_other_nodes,node_load):
    time = executionTimePlannedWithCPU(cpu_cores,get_data_other_nodes)

    if gpu_cores != 0:
        time = executionTimePlannedWithGPU(gpu_cores,use_arm,get_data_other_nodes)
    
    return (1.0+node_load)*time


def executionTimePlannedWithCPU(cpu_cores,get_data_other_nodes):
    ...
    #Here I define an approach function to cpu time


def executionTimePlannedWithGPU(gpu_cores,use_arm,get_data_other_nodes):
    ...
    # The same with GPU time

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getEnergyConsumptionPlanning(cpu_cores,gpu_cores,use_arm,get_data_other_nodes,node_load):
    energy = energyPlannedWithCPU(cpu_cores,get_data_other_nodes)

    if gpu_cores != 0:
        energy = energyPlannedWithGPU(gpu_cores,use_arm,get_data_other_nodes)

    return (1.0+node_load)*energy


def energyPlannedWithCPU(cpu_cores,get_data_other_nodes):
    ...
    # The same but energy with CPU

def energyPlannedWithGPU(gpu_cores,use_arm,get_data_other_nodes):
    ...
    # The same as before with GPU
