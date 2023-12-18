from platypus import NSGAII,SPEA2,MOEAD,CMAES,OMOPSO,IBEA, Problem, Real   # Differential evolution algorithm? OMOPSO algorithm?
import numpy as np
import random

# For execution time, we use expression {1/(n_cores)^p}, where p depemds on hardware technology used, i.e, p_CPU < p_ARM < p_GPU. Justification is explained in https://github.com/AlvaroRodriguezGallardo/src-brokering/blob/main/docs/broker/MOEA/broker_optimisation_algorithm.pdf

# It is an example for simulation. It should be chosen using experiments with real data
p_CPU = 1
p_ARM = 2
p_GPU = 3
N_execution_plannings = 1 # It could generalise to a array of dictionaries but functions must be tight

max_cpu_cores = 10
max_gpu_cores = 10
max_arm_cores = 10
max_node_in_graph = 40
                                
class MOEAforbroker(Problem):
    def __init__(self, N_functions_tuplas=2,P_decision_var=4):
        # I establish objectives number (N functions) and how many decision variables there are
        super(MOEAforbroker,self).__init__(P_decision_var,N_functions_tuplas)

        # I define decision variables limits. Between 0 and 1. Near to 1 is a good option in the execution planning
        #self.types[:] = [Real(0,1)]*N_functions
        self.types[:] = [Real(0,max_cpu_cores),Real(0,max_gpu_cores),Real(0,max_arm_cores),Real(0,1)]   #Independent variables and their domain
                                                        # Maybe can they only be positive?
    #    N_nodes_need = random.randint(0, max_node_in_graph)  # Platypus cannot use a list for a decision variable, but we can do it manually, but max nodes in the graph are needed
     #   for i in range(4,N_nodes_need+4):   # If N_nodes_need = 0, then this loop is not executed 
      #          self.types.append(Integer(0,N_nodes_need))
    
        # What do I want to? --> A minimization problem
        #self.directions[:] = [self.MINIMIZE] * N_functions
        self.directions[:] = [Problem.MINIMIZE,Problem.MINIMIZE]    # Vector I want to get. Imagine this function F:R^5 --> R^2

    def evaluate(self,solution):
        # I get values of decision variables
        values = solution.variables
        
        # It is supposed 'values' a dictionary as it is inisialised in main function
        # Evaluation function is used to evaluate execution planning given
        t_exec, e_consumption = evaluate_function(values)

        #  I put my objectives values in an array. They are values I want to minimise (?) YES
        solution.objectives[:] = [t_exec,e_consumption]


def averageNormalDistribution():
    average = 0
    variance = 1
    value = np.random.normal(loc=average,scale=variance,size=1)

    return value[0]

# Auxiliar function in which time is got
def getRandomTime():
    # It is supposed a typical normal
    # It models time, so we make sure it is a non negative float
    return np.abs(averageNormalDistribution())

def getRandomEnergy():
    # Energy >= 0.0
    # It models time, so we make sure it is a non negative float
    return np.abs(averageNormalDistribution())

# Evaluation function
# Some variables are needed for MOEA. 'values' is a dictionary with next fields:
#   - CPU cores: How many cores are needed within proposed solution with CPU?  --> CPU is basical case--> float (we could want to use 1.5 CPUs)
#   - GPU cores: How many cores are needed if it uses GPU? ---> double (we could want to use 1.5 GPUs)
#   - ARM cores: How many cores are needed if it uses ARM? ---> double (ídem)
#   - get_data_other_nodes: Do I need data from different nodes? ---> List
#   - node_load: Which is node_load in the last x days?--> float \in [0,1] 
# Evaluation function receives a dictionary 'solution' which is the proposed one to the algorithm

def evaluate_function(values):
    cpu_cores = values[0]                         # double
    gpu_cores = values[1]                         # double. If gpu_cores==0, then it is supposed GPU is not needed
    arm_cores = values[2]                             # double
    node_load = values[3]                         # Float \in [0,1]

   # get_data_other_nodes = values[4:]           # List<int>. If get_data_other_nodes.is_empty(), then it is supposed all needed data is within the node
    get_data_other_nodes = []

    N_nodes_need = random.randint(0,max_node_in_graph)
    id_my_node = random.randint(0,max_node_in_graph)        # Maybe node in which function is executed is not in the list of avaliable nodes
    for i in range(0,N_nodes_need):
        id_node = random.randint(0,N_nodes_need)
        if id_node != id_my_node:
            get_data_other_nodes.append(id_node)

   # assert cpu_cores>0, "Specify how many cores you want to run in CPU"
    assert 0.0<=node_load<=1.0, "node_load must be a float between 0.0 and 1.0"

    # I implement restrictions about cores. If cpu_cores > 0 then gpu_cores = arm_cores = 0. But they are real positive numbers, then randomly I will do that
    which_hardware_used = random.randint(0,2)
    if which_hardware_used == 0:
        gpu_cores = arm_cores = 0.0
    if which_hardware_used == 1:
        cpu_cores = arm_cores = 0.0
    if which_hardware_used == 2:
        cpu_cores = gpu_cores = 0.0

    t_execution_planning = getExecutionTimePlanning(cpu_cores=cpu_cores,gpu_cores=gpu_cores,arm_cores=arm_cores,get_data_other_nodes=get_data_other_nodes,node_load=node_load)
    energy_consumption = getEnergyConsumptionPlanning(cpu_cores=cpu_cores,gpu_cores=gpu_cores,arm_cores=arm_cores,get_data_other_nodes=get_data_other_nodes,node_load=node_load)
 
    return t_execution_planning,energy_consumption

# In this problem, it is supposed VARIABLES ARE INDEPENDENT, EVEN IF SOME SOLUTIONS CONSIDER THEM AS RANDOM VARIABLES

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If arm_cores==0, then ARM will not be needed
#   - It is supposed hardware technology is exclusive (i.e. if ARM is used, then CPU and GPU are not used)
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getExecutionTimePlanning(cpu_cores,gpu_cores,arm_cores,get_data_other_nodes,node_load):
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

def getEnergyConsumptionPlanning(cpu_cores,gpu_cores,arm_cores,get_data_other_nodes,node_load):
   
    if cpu_cores != 0.0 and gpu_cores == 0.0 and arm_cores == 0.0:
        energy = energyPlannedWithCPU(cpu_cores,get_data_other_nodes)
    
    if cpu_cores == 0.0 and gpu_cores != 0.0 and arm_cores == 0.0:
        energy = energyPlannedWithGPU(gpu_cores,get_data_other_nodes)
   
    if cpu_cores == 0.0 and gpu_cores == 0.0 and arm_cores != 0.0:
        energy = energyPlannedWithARM(arm_cores,get_data_other_nodes)

    return (1.0+node_load)*energy


def energyPlannedWithCPU(cpu_cores,get_data_other_nodes):
    # The same but energy with CPU
    EnWaitingNode = 0.0
    EnConsTransmission = 0.0

    for node in get_data_other_nodes:
        # While this loop is running, EnWaitingNode should increase
        EnConsTransmission = EnConsTransmission + getRandomEnergy()
        # Here this thread should be waiting to another thread work
        EnWaitingNode = EnWaitingNode + getRandomEnergy()   # It could be modelised with a semaphore or monitor
        # IF WE SHOULD TAKE INTO ACCOUNT ENERGY IN OTHER NODE, WE SHOULD DO IT HERE

    EnConsumptionProcessing = getRandomEnergy() * (cpu_cores**p_CPU)

    return (EnConsumptionProcessing+EnConsTransmission+EnWaitingNode)

def energyPlannedWithGPU(gpu_cores,get_data_other_nodes):
    # The same as before with GPU
    EnWaitingNode = 0.0
    EnConsTransmission = 0.0

    for node in get_data_other_nodes:
        # While this loop is running, EnWaitingNode should increase
        EnConsTransmission = EnConsTransmission + getRandomEnergy()
        # Here this thread should be waiting to another thread work
        EnWaitingNode = EnWaitingNode + getRandomEnergy()   # It could be modelised with a semaphore or monitor
        # IF WE SHOULD TAKE INTO ACCOUNT ENERGY IN OTHER NODE, WE SHOULD DO IT HERE WITH RECURSIVITY

    EnConsumptionProcessing = getRandomEnergy() * (gpu_cores**p_GPU)

    return (EnConsumptionProcessing+EnConsTransmission+EnWaitingNode)

def energyPlannedWithARM(arm_cores,get_data_other_nodes):
    EnWaitingNode = 0.0
    EnConsTransmission = 0.0

    for node in get_data_other_nodes:
        # While this loop is running, EnWaitingNode should increase
        EnConsTransmission = EnConsTransmission + getRandomEnergy()
        # Here this thread should be waiting to another thread work
        EnWaitingNode = EnWaitingNode + getRandomEnergy()   # It could be modelised with a semaphore or monitor
        # IF WE SHOULD TAKE INTO ACCOUNT ENERGY IN OTHER NODE, WE SHOULD DO IT HERE

    EnConsumptionProcessing = getRandomEnergy() * (arm_cores**p_ARM)

    return (EnConsumptionProcessing+EnConsTransmission+EnWaitingNode)

if __name__ == "__main__":
    # IN THIS PROGRAM, IT IS SUPPOSED WE WANT TO RUN A FUNCTION IN A CERTAIN NODE
    # Here, do I initialize some random execution plans?
    # I suppose cores have a typical normal distribution  (I guess it does not matter, because they can be float, but firstly I thought in a binomial distribution --> it returns natural numbers)
   
#    execution_plannings = []

 ##   for i in range(0,N_execution_plannings):
 #       n_nodes_needed = random.randint(0,10)    # 0 if we do not need data from other nodes
 #       random_nodes = []
 #       for j in range(0,n_nodes_needed):
 #           random_nodes.append(random.random())    # In this simulation, we only need to know how many nodes the node needs to, but in a real situation, we should know quantity an which nodes are
 #       plan = {
 #           'cpu_cores' : np.abs(averageNormalDistribution()),
 #           'gpu_cores' : np.abs(averageNormalDistribution()),
 #           'arm_cores' : np.abs(averageNormalDistribution()),
 #           'get_data_other_nodes': random_nodes,
 #           'data_load': random.uniform(0,1)
 #       }
 #       execution_plannings.append(plan)

    # An instance of our problem
    problem = MOEAforbroker()

    # Some algorithms we can execute, in an array
    algorithms = [NSGAII(problem), SPEA2(problem), MOEAD(problem), CMAES(problem), IBEA(problem)]

    with open('soluciones_MOEAs.txt', 'w') as file:
        for alg in algorithms:
            file.write(str(alg) + "\n")
            
            alg.run(10000)

            optimal_solutions = alg.result
            for solution in optimal_solutions:
                file.write("Execution time: " + str(solution.variables[0]) + "\n")
                file.write("Energy consumption: " + str(solution.variables[1]) + "\n")
                file.write("Objectives: " + str(solution.objectives) + "\n")
                file.write("\n")

            file.write("----\n")
