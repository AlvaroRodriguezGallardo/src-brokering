from platypus import NSGAII,SPEA2,MOEAD,CMAES,OMOPSO,IBEA, Problem, Real,Integer   # Differential evolution algorithm? OMOPSO algorithm?
import numpy as np
import random
import matplotlib.pyplot as plt

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
    def __init__(self, N_functions_tuplas=2,P_decision_var=3):
        # I establish objectives number (N functions) and how many decision variables there are
        super(MOEAforbroker,self).__init__(P_decision_var,N_functions_tuplas)

        # I define decision variables limits. Between 0 and 1. Near to 1 is a good option in the execution planning
        #self.types[:] = [Real(0,1)]*N_functions
        self.types[:] = [Integer(0,max_cpu_cores),Integer(0,max_gpu_cores),Integer(0,max_arm_cores)]   #Independent variables and their domain
                                                        # Maybe can they only be positive?
    
        # Some constraints are defined:  they can not be zero at the same time (1) and if one of them is positive, rest of them are zero (2)  (the last one is because of how is implemented our function)
        # Platypus logic in manually implemented constraints: solution is valid if it returns a value <=0

        self.constraints[:] = [not_zero_at_same_time,if_one_positive_rest_zero]

        # What do I want to? --> A minimization problem
        #self.directions[:] = [self.MINIMIZE] * N_functions
        self.directions[:] = [Problem.MINIMIZE,Problem.MINIMIZE]    # Vector I want to get. Imagine this function F:R^3 --> R^2

    def evaluate(self,solution):
        # I get values of decision variables
        values = solution.variables
        
        # It is supposed 'values' a dictionary as it is inisialised in main function
        # Evaluation function is used to evaluate execution planning given
        t_exec, e_consumption = evaluate_function(values)
        if t_exec<=0.0 or e_consumption<=0.0:   # I penalise if one of them is 0.0 --> in reality, it is not possible
            t_exec = e_consumption = 1000
        #  I put my objectives values in an array. They are values I want to minimise (?) YES

        solution.objectives[:] = [t_exec,e_consumption]

#--------------------------------------------------------------------- DEFINING HERE SOME CONSTRAINTS ----------------------------------------------------------------------------------

# It is the easiest way to prove if are zero or not at the same time (if yes, it returns 0.0). It could be useful because they are not negative numbers
# Note: I have been studied a bit Platypus, and if constraints are defined manually, then it uses '<=0' if a solution is valid
def not_zero_at_same_time(vars):
    x,y,z = vars
    t = x+y+z

    if t>0:
        return -1.0
    else:
        return 1.0

# A solution is valid while only one of them is positive and rest of them are zero. At least one is positive because of the previous constraint
def if_one_positive_rest_zero(vars):
    x,y,z=vars
    count_positive_var = 0
    # Number of positive values
    if x>0:
        count_positive_var=count_positive_var+1
    if y>0:
        count_positive_var=count_positive_var+1
    if z>0:
        count_positive_var=count_positive_var+1
    
    # If only one of them is positive, we do not do nothing
    if count_positive_var==1:
        return -1.0
    else:
        return 1.0  # In other case, it is not a valid solution
    


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#--------------------------------------------------------------------- RANDOM VALUES FUNCTIONS ------------------------------------------------------------------------------------------

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

# -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ------------------------------------------------------------------- EVALUATION FUNCTION -------------------------------------------------------------------------------------------------
# Evaluation function
# Some variables are needed for MOEA. 'values' is a dictionary with next fields:
#   - CPU cores: How many cores are needed within proposed solution with CPU?  --> CPU is basical case--> float (we could want to use 1.5 CPUs)
#   - GPU cores: How many cores are needed if it uses GPU? ---> double (we could want to use 1.5 GPUs)
#   - ARM cores: How many cores are needed if it uses ARM? ---> double (ídem)
# Other values are needed, but they are independent of broker 
#   - get_data_other_nodes: Do I need data from different nodes? ---> List
#   - node_load: Which is node_load in the last x days?--> float \in [0,1] 
# Evaluation function receives a dictionary 'solution' which is the proposed one to the algorithm

def evaluate_function(values):
    cpu_cores = values[0]                         # double
    gpu_cores = values[1]                         # double. If gpu_cores==0, then it is supposed GPU is not needed
    arm_cores = values[2]                             # double
 #   node_load = values[3]                         # Float \in [0,1]

   # get_data_other_nodes = values[4:]           # List<int>. If get_data_other_nodes.is_empty(), then it is supposed all needed data is within the node
    get_data_other_nodes = []

    # IT SHOULD BE GIVEN BY ANOTHER ALGORITHM, WHO KNOWS ABOUT OUR SYSTEM AND WHICH IS NEEDED IN EACH WSCLEAN FUNCTION
    N_nodes_need = random.randint(0,max_node_in_graph)
    id_my_node = random.randint(0,max_node_in_graph)        # Maybe node in which function is executed is not in the list of avaliable nodes
    for i in range(0,N_nodes_need):
        id_node = random.randint(0,N_nodes_need)
        if id_node != id_my_node:
            get_data_other_nodes.append(id_node)

   # assert cpu_cores>0, "Specify how many cores you want to run in CPU"
    node_load = random.uniform(0.0,1.0)

    t_execution_planning = getExecutionTimePlanning(cpu_cores=cpu_cores,gpu_cores=gpu_cores,arm_cores=arm_cores,get_data_other_nodes=get_data_other_nodes,node_load=node_load)
    energy_consumption = getEnergyConsumptionPlanning(cpu_cores=cpu_cores,gpu_cores=gpu_cores,arm_cores=arm_cores,get_data_other_nodes=get_data_other_nodes,node_load=node_load)
 
    return t_execution_planning,energy_consumption

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------- EXECUTION TIME MODULE ----------------------------------------------------------------------------------------
# In this problem, it is supposed VARIABLES ARE INDEPENDENT, EVEN IF SOME SOLUTIONS CONSIDER THEM AS RANDOM VARIABLES

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If arm_cores==0, then ARM will not be needed
#   - It is supposed hardware technology is exclusive (i.e. if ARM is used, then CPU and GPU are not used)
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getExecutionTimePlanning(cpu_cores,gpu_cores,arm_cores,get_data_other_nodes,node_load):
    time=0.0
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

# 1) Do I need data from other nodes?-->YES: For each node I get time spent in operations with other node (recursive call)
#                                    -->NO: No time is spent in this operation
# 2) Time spent with operations within node: It is a parallel program:
#   2.1) I have all data I need within node--> I get all data I need depending on function (important because in this way I discriminate data storaged within node)
#   2.2) I know what I must run, then I do that

def executionTimePlannedWithCPU(cpu_cores,get_data_other_nodes):
    #Here I define an approach function to cpu time
        # Now, I do the same with transmission time

    t_i_j_final = 0.0
    t_j_i_final = 0.0
    time_other_nodes_final = 0.0

    if(len(get_data_other_nodes)>0):    # Only if data from other nodes is needed we have to consider this time
        t_i_j=0.0
        for node_index in get_data_other_nodes:
            t_i_j = t_i_j + getTCommunication(-1,node_index)   # We should know index of current node

        t_i_j_final = t_i_j
        
        time_other_nodes = 0.0
        for node_index in get_data_other_nodes: #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            # We should use a function in which cpu_cores/arm_cores/gpu_cores for foreign node are indicated
            # which node should be executed, and if it needs data from different nodes, it should be indicated too
            time_other_nodes = time_other_nodes + getRandomTime()    # Replace `getRandomTime() with `getExecutionTimePlanning` (it is more complex, we do not know at first how many cores, which technology should be used,...)
        time_other_nodes_final = time_other_nodes

        t_j_i = 0.0
        for node_index in get_data_other_nodes:
            t_j_i = t_j_i + getTCommunication(node_index,-1)
        t_j_i_final = t_j_i
        

    # We process data within node

    # Then I get data within node. In this function we have data needed from other nodes
    tAccessData =getTAccessData('wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms')
    tProcessingData = getTProcessingData('wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms')

    tExecutingFunction = (tAccessData+tProcessingData) / (cpu_cores**p_CPU)

    return (tExecutingFunction + t_i_j_final + t_j_i_final + time_other_nodes_final)


def executionTimePlannedWithGPU(gpu_cores,get_data_other_nodes):
    # The same with GPU time
    # Now, I do the same with transmission time

    t_i_j_final = 0.0
    t_j_i_final = 0.0
    time_other_nodes_final = 0.0

    if(len(get_data_other_nodes)>0):    # Only if data from other nodes is needed we have to consider this time
        t_i_j=0.0
        for node_index in get_data_other_nodes:
            t_i_j = t_i_j + getTCommunication(-1,node_index)   # We should know index of current node

        t_i_j_final = t_i_j
        
        time_other_nodes = 0.0
        for node_index in get_data_other_nodes: #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            # We should use a function in which cpu_cores/arm_cores/gpu_cores for foreign node are indicated
            # which node should be executed, and if it needs data from different nodes, it should be indicated too
            time_other_nodes = time_other_nodes + getRandomTime()    # Replace `getRandomTime() with `getExecutionTimePlanning` (it is more complex, we do not know at first how many cores, which technology should be used,...)
        time_other_nodes_final = time_other_nodes

        t_j_i = 0.0
        for node_index in get_data_other_nodes:
            t_j_i = t_j_i + getTCommunication(node_index,-1)
        t_j_i_final = t_j_i
        

    # We process data within node

    # Then I get data within node. In this function we have data needed from other nodes
    tAccessData =getTAccessData('wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms')
    tProcessingData = getTProcessingData('wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms')

    tExecutingFunction = (tAccessData+tProcessingData) / (gpu_cores**p_GPU)

    return (tExecutingFunction + t_i_j_final + t_j_i_final + time_other_nodes_final)


def executionTimePlannedWithARM(arm_cores,get_data_other_nodes):
    #Here I define an approach function to arm time

    # Now, I do the same with transmission time

    t_i_j_final = 0.0
    t_j_i_final = 0.0
    time_other_nodes_final = 0.0

    if(len(get_data_other_nodes)>0):    # Only if data from other nodes is needed we have to consider this time
        t_i_j=0.0
        for node_index in get_data_other_nodes:
            t_i_j = t_i_j + getTCommunication(-1,node_index)   # We should know index of current node

        t_i_j_final = t_i_j
        
        time_other_nodes = 0.0
        for node_index in get_data_other_nodes: #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            # We should use a function in which cpu_cores/arm_cores/gpu_cores for foreign node are indicated
            # which node should be executed, and if it needs data from different nodes, it should be indicated too
            time_other_nodes = time_other_nodes + getRandomTime()    # Replace `getRandomTime() with `getExecutionTimePlanning` (it is more complex, we do not know at first how many cores, which technology should be used,...)
        time_other_nodes_final = time_other_nodes

        t_j_i = 0.0
        for node_index in get_data_other_nodes:
            t_j_i = t_j_i + getTCommunication(node_index,-1)
        t_j_i_final = t_j_i
        

    # We process data within node

    # Then I get data within node. In this function we have data needed from other nodes
    tAccessData =getTAccessData('wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms')
    tProcessingData = getTProcessingData('wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms')

    tExecutingFunction = (tAccessData+tProcessingData) / (arm_cores**p_ARM)

    return (tExecutingFunction + t_i_j_final + t_j_i_final + time_other_nodes_final)

# Time spent getting data within node in which function is executed
def getTAccessData(my_function):
    # IMPLEMENTAR MODELO. ACCEDER A LOS DATOS
    return None

# Time spent processing data within node. Previously this data has been got
def tProcessingData(my_function):
    # IMPLEMENTAR MODELO. PROCESAR LOS DATOS QUE SE HAN OBTENIDO ANTES
    return None

# Time spent communicating with other node. It is a prototype, but distance_i_j and bandwith are not constants
def tCommunication(node_i,node_j):
    distance_i_j=10000  # m
    bandwith = 50000   # MB/s

    return (distance_i_j/bandswith)  # s
# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------- ENERGY CONSUMPTION MODULE ------------------------------------------------------------------------------------------------------

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getEnergyConsumptionPlanning(cpu_cores,gpu_cores,arm_cores,get_data_other_nodes,node_load):
    energy=0.0
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

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------- MAIN FUNCTION -------------------------------------------------------------------------------------------------

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
   # algorithms = [NSGAII(problem), SPEA2(problem), MOEAD(problem), CMAES(problem), IBEA(problem)]
    algorithms = [NSGAII(problem)]
    for alg in algorithms:
            
        alg.run(10000)

        optimal_solutions = alg.result

        objective_time = []   # First objective
        objective_energy = []   # Second objective

        for solution in optimal_solutions:  # I store every point of optimal solutions for algorithm
            objective_time.append(solution.objectives[0])
            objective_energy.append(solution.objectives[1])
            print("Execution time: "+str(solution.objectives[0])+". Energy Consumption: "+str(solution.objectives[1]))

        # Create graphics
        fig,ax = plt.subplots()

        # Writing points in graphic
        ax.scatter(objective_time,objective_energy)

        # Adding some specifications
        ax.set_xlabel('Execution time')
        ax.set_ylabel('Energy consumption')
        ax.set_title(f'Optimal Solutions for {str(alg)}')

        # Saving graphic
        plt.savefig(f'{str(alg)}_optimal_solutions.png')


# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
