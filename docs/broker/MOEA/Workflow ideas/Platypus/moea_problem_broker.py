from platypus import NSGAIII, DTLZ2


# For execution time, we use expression {1/(n_cores)^p}, where p depemds on hardware technology used, i.e, p_CPU < p_ARM < p_GPU. Justification is explained in https://github.com/AlvaroRodriguezGallardo/src-brokering/blob/main/docs/broker/MOEA/broker_optimisation_algorithm.pdf

# It is an example for simulation. It should be chosen using experiments with real data
p_CPU = 1
p_ARM = 2
p_GPU = 3

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
#   - CPU cores: How many cores are needed within proposed solution with CPU?  --> CPU is basical case--> float (we could want to use 1.5 CPUs)
#   - GPU cores: How many cores are needed if it uses GPU? ---> double (we could want to use 1.5 GPUs)
#   - ARM cores: How many cores are needed if it uses ARM? ---> double (ídem)
#   - get_data_other_nodes: Do I need data from different nodes? ---> List
#   - node_load: Which is node_load in the last x days?--> float \in [0,1] 
# Evaluation function receives a dictionary 'solution' which is the proposed one to the algorithm

def evaluate_function(values):
    cpu_cores = values["cpu_cores"]                         # double
    gpu_cores = values["gpu_cores"]                         # double. If gpu_cores==0, then it is supposed GPU is not needed
    arm_cores = values["arm_cores"]                             # double
    get_data_other_nodes = values["get_data_other_nodes"]   # List<int>. If get_data_other_nodes.is_empty(), then it is supposed all needed data is within the node
    node_load = values["node_load"]                         # Float \in [0,1]

   # assert cpu_cores>0, "Specify how many cores you want to run in CPU"
    assert 0.0<=node_load<=1.0, "node_load must be a float between 0.0 and 1.0"

    t_execution_planning = getExecutionTimePlanning(cpu_cores=cpu_cores,gpu_cores=gpu_cores,use_arm=use_arm,get_data_other_nodes=get_data_other_nodes,node_load=node_load)
    energy_consumption = getEnergyConsumptionPlanning(cpu_cores=cpu_cores,gpu_cores=gpu_cores,use_arm=use_arm,get_data_other_nodes=get_data_other_nodes,node_load=node_load)

    return t_execution_planning,energy_consumption

# In this problem, it is supposed VARIABLES ARE INDEPENDENT, EVEN IF SOME SOLUTIONS CONSIDER THEM AS RANDOM VARIABLES

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If arm_cores==0, then ARM will not be needed
#   - It is supposed hardware technology is exclusive (i.e. if ARM is used, then CPU and GPU are not used)
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getExecutionTimePlanning(cpu_cores,gpu_cores,use_arm,get_data_other_nodes,node_load):
    
    if cpu_cores != 0.0 and gpu_cores == 0.0 and arm_cores == 0.0:
        time = executionTimePlannedWithCPU(cpu_cores,get_data_other_nodes)

    if cpu_cores == 0.0 and gpu_cores != 0.0 and arm_cores == 0.0:
        time = executionTimePlannedWithGPU(gpu_cores,get_data_other_nodes)

    if cpu_cores == 0.0 and gpu_cores == 0.0 and arm_cores != 0.0:
        time = executionTimePlannedWithARM(arm_cores,get_data_other_nodes)

    return (1.0+node_load)*time


# Because I do not know if planned behaviour for CPU/ARM/GPU is correct, I repeat code. If CPU/ARM/GPU influences in other variables, there is not a problem. In other case, we can bind
# this functions in a single function
# For a simulation, I use `getRandomTime()`, which return random data which has a normal distribution
def executionTimePlannedWithCPU(cpu_cores,get_data_other_nodes):
    #Here I define an approach function to cpu time
    # Firstly, supposing a parallel program, it is got transfer time, which process data from other nodes
    tTransf = 0.0
    for node_index in get_data_other_nodes:
        tTransf = tTransf + getRandomTime()
    tTransf_final = tTransf / (cpu_cores**p_CPU)

    # Then I get data within node, if there is
    tAccessData = getRandomTime()

    # Now, I do the same with transmission time
    t_i_j = 0.0
    for node_index in get_data_other_nodes:
        t_i_j = t_i_j + getRandomTime()

    t_i_j_final = t_i_j
    
    t_j_i = 0.0
    for node_index in get_data_other_nodes:
        t_j_i = t_j_i + getRandomTime()
    t_j_i_final = t_j_i

    # Lastly, if I need data from other nodes, I have to wait that time. We can model ir with a recursive function
    time_other_nodes = 0.0
    for node_index in get_data_other_nodes:
        # We should use a function in which cpu_cores/arm_cores/gpu_cores for foreign node are indicated
        # which node should be executed, and if it needs data from different nodes, it should be indicated too
        time_other_nodes = time_other_nodes + getRandomTime()   # Replace `getRandomTime() with `getExecutionTimePlanning` (it is more complex, we do not know at first how many cores, which technology should be used,...)
    time_other_nodes_final = time_other_nodes

    return (tTransf_final + t_i_j_final + t_j_i_final + time_other_nodes_final)


def executionTimePlannedWithGPU(gpu_cores,get_data_other_nodes):
    # The same with GPU time
    #Here I define an approach function to gpu time
    # Firstly, supposing a parallel program, it is got transfer time, which process data from other nodes
    tTransf = 0.0
    for node_index in get_data_other_nodes:
        tTransf = tTransf + getRandomTime()
    tTransf_final = tTransf / (gpu_cores**p_GPU)

    # Then I get data within node, if there is
    tAccessData = getRandomTime()

    # Now, I do the same with transmission time
    t_i_j = 0.0
    for node_index in get_data_other_nodes:
        t_i_j = t_i_j + getRandomTime()

    t_i_j_final = t_i_j
    
    t_j_i = 0.0
    for node_index in get_data_other_nodes:
        t_j_i = t_j_i + getRandomTime()
    t_j_i_final = t_j_i

    # Lastly, if I need data from other nodes, I have to wait that time. We can model ir with a recursive function
    time_other_nodes = 0.0
    for node_index in get_data_other_nodes:
        # We should use a function in which cpu_cores/arm_cores/gpu_cores for foreign node are indicated
        # which node should be executed, and if it needs data from different nodes, it should be indicated too
        time_other_nodes = time_other_nodes + getRandomTime()    # Replace `getRandomTime() with `getExecutionTimePlanning` (it is more complex, we do not know at first how many cores, which technology should be used,...)
    time_other_nodes_final = time_other_nodes

    return (tTransf_final + t_i_j_final + t_j_i_final + time_other_nodes_final)

def executionTimePlannedWithARM(arm_cores,get_data_other_nodes):
    #Here I define an approach function to arm time
    # Firstly, supposing a parallel program, it is got transfer time, which process data from other nodes
    tTransf = 0.0
    for node_index in get_data_other_nodes:
        tTransf = tTransf + getRandomTime()
    tTransf_final = tTransf / (arm_cores**p_ARM)

    # Then I get data within node, if there is
    tAccessData = getRandomTime()

    # Now, I do the same with transmission time
    t_i_j = 0.0
    for node_index in get_data_other_nodes:
        t_i_j = t_i_j + getRandomTime()

    t_i_j_final = t_i_j
    
    t_j_i = 0.0
    for node_index in get_data_other_nodes:
        t_j_i = t_j_i + getRandomTime()
    t_j_i_final = t_j_i

    # Lastly, if I need data from other nodes, I have to wait that time. We can model ir with a recursive function
    time_other_nodes = 0.0
    for node_index in get_data_other_nodes:
        # We should use a function in which cpu_cores/arm_cores/gpu_cores for foreign node are indicated
        # which node should be executed, and if it needs data from different nodes, it should be indicated too
        time_other_nodes = time_other_nodes + getRandomTime()    # Replace `getRandomTime() with `getExecutionTimePlanning` (it is more complex, we do not know at first how many cores, which technology should be used,...)
    time_other_nodes_final = time_other_nodes

    return (tTransf_final + t_i_j_final + t_j_i_final + time_other_nodes_final)
# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getEnergyConsumptionPlanning(cpu_cores,gpu_cores,arm_nodes,get_data_other_nodes,node_load):
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
