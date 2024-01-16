from platypus import NSGAII,SPEA2,MOEAD,CMAES,OMOPSO,IBEA, Problem, Real,Integer   # Differential evolution algorithm? OMOPSO algorithm?
import numpy as np
import random
import matplotlib.pyplot as plt
import sys # Getting function
import time
import subprocess
import json
import argparse
import logging

logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s') 
# For execution time, we use expression {1/(n_cores)^p}, where p depemds on hardware technology used, i.e, p_CPU < p_ARM < p_GPU. Justification is explained in https://github.com/AlvaroRodriguezGallardo/src-brokering/blob/main/docs/broker/MOEA/broker_optimisation_algorithm.pdf

# It is an example for simulation. It should be chosen using experiments with real data
p_CPU = 1
p_ARM = 2
p_GPU = 3
N_execution_plannings = 1 # It could generalise to a array of dictionaries but functions must be tight

max_node_in_graph = 0
max_cpus_in_each_node = []
max_gpus_in_each_node = []
max_arms_in_each_node = []
load_in_each_node = []
transmission_bandswith = []     # List of list of dictionaries. For example, in N1, it is position 0 in `transmission_bandswith`, and transmission_bandswith[0]={'2':3,'5':10}. Consequently, N1 is connected with N2 and N5
data_avaliable = []             # List of lists (string)

class MOEAforbroker(Problem):    
    def __init__(self, N_functions_tuplas=2,P_decision_var=3):
        self.dictionary_functions = []
        # I establish objectives number (N functions) and how many decision variables there are
        super(MOEAforbroker,self).__init__(P_decision_var,N_functions_tuplas)

        # I define decision variables limits. Between 0 and 1. Near to 1 is a good option in the execution planning
            # Tres elementos por cada nodo. Para saber de qué nodo son, tal como está planteado el problema, dado un elem de self.types, 
            # se cumple que posicion(elem)//3 + 1 es el id del nodo. Pongamos un ejemplo:
            # Si posicion(elem)= 2 --> 2//3 + 1 = 0+1 = 1 -->nodo 1
            # Si posicion(elem) = 10 --> 10//3 + 1 = 3+1=4 --> nodo 4
            # Si posicion(elem) =100 --> 100//3 + 1 =33+1 = 34 --> nodo 34
            # Creo que se puede probar por inducción que N//3 + 1 es el nodo correspondiente. Se puede generalzar a N//P_decision_var + 1 para P_decision_var > 1
            # Es cierto para N=0, pues 0//3 + 1 = 1 -->nodo 1
            # Supuesto cierto que lo es N//3 +1, veamos (N+1)//3 +1
            # (N+1)//3 + 1 = N//3 + 1//3 + 1 = N//3 +0 + 1 = N//3 + 1, qué es cierto por hipótesis
            # En consecuencia, si quiero acceder a los cores de cpu del nodo 1, sería self.types[0], del nodo 2 self.types[3],..., del nodo N self.types[3(N-1)]
            # Para los cores de gpu del nodo N, self.types[3(N-1) + 1]
            # Para los cores de arm del nodo N, self.types[3(N-1) + 2]
            # Se puede generalizar a P variables de decisión, M nodos --> hacemos el sistema escalable, y si se implementa bien, podemos añadir y quitar variables
            # de decisión sin problema
        self.types.clear()
        for i in range(max_node_in_graph):
            self.types.append(Integer(0, max_cpus_in_each_node[i]))
            self.types.append(Integer(0, max_gpus_in_each_node[i]))
            self.types.append(Integer(0, max_arms_in_each_node[i]))
    
        # Some constraints are defined:  they can not be zero at the same time (1) and if one of them is positive, rest of them are zero (2)  (the last one is because of how is implemented our function)
        # Platypus logic in manually implemented constraints: solution is valid if it returns a value <=0

        self.constraints[:] = [not_zero_at_same_time,if_one_positive_rest_zero]

        # What do I want to? --> A minimization problem
        #self.directions[:] = [self.MINIMIZE] * N_functions
        self.directions[:] = [Problem.MINIMIZE,Problem.MINIMIZE]    # Vector I want to get. Imagine this function F:R^3 --> R^2

    def evaluate(self,solution):
        # I get values of decision variables
        values = solution.variables
        t_exec = e_consumption = 0.0
        # It is supposed 'values' a dictionary as it is inisialised in main function
        # Evaluation function is used to evaluate execution planning given

        for func in self.list_of_functions:
            t_for_f,e_for_f = evaluate_function(values,func)
            t_exec = t_exec + t_for_f
            e_consumption = e_consumption + e_for_f

        if t_exec<=0.0 or e_consumption<=0.0:   # I penalise if one of them is 0.0 --> in reality, it is not possible
            t_exec = e_consumption = 1000
        #  I put my objectives values in an array. They are values I want to minimise (?) YES

        solution.objectives[:] = [t_exec,e_consumption]

    # Setting functions we want to run within system
    def setFunctionsToRun(functions):
        self.dictionary_functions = functions

    ## Getting functions. Debugging
    def getFunctionsToRun():
        return self.dictionary_functions.copy()

#--------------------------------------------------------------------- DEFINING HERE SOME CONSTRAINTS ----------------------------------------------------------------------------------

# It is the easiest way to prove if are zero or not at the same time (if yes, it returns 0.0). It could be useful because they are not negative numbers
# Note: I have been studied a bit Platypus, and if constraints are defined manually, then it uses '<=0' if a solution is valid
def not_zero_at_same_time(vars):
    # Supongo 3 variables de decisión por nodo
    for i in range(0,len(vars),3)
        aux = vars[i] + vars[i+1]+vars[i+2]
        if aux == 0:
            return 1.0

    return -1.0

# A solution is valid while only one of them is positive and rest of them are zero. At least one is positive because of the previous constraint
def if_one_positive_rest_zero(vars):
    # Supongo 3 variables de decisión por nodo
    for i in range(0,len(vars),3):
        count_positive_var = 0
        # Number of positive values
        if vars[i]>0:
            count_positive_var=count_positive_var+1
        if vars[i+1]>0:
            count_positive_var=count_positive_var+1
        if vars[i+2]>0:
            count_positive_var=count_positive_var+1
    
    # If only one of them is positive, we do not do nothing
        if count_positive_var>1:
            return 1.0

    return -1.0
    


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#-------------------------------------------------------------------- OTHER AUXILIAR FUNCTIONS ------------------------------------------------------------------------------------------

def obtenerDeNodoNVariableK(lista,N_nodo,K_variable):
    return lista[P_variables_decision*(N_nodo-1) + (K_variable-1)]

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

# EXTENDER FUNCIÓN OBJETIVO A P VARIABLES Y M NODOS
def evaluate_function(values,my_function):
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
    # or if I want to execute 'my_function', get dependencies



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
        logging.info("Execution time with CPU. Cores: "+str(cpu_cores)+". Dependencies: "+str(get_data_other_nodes))
        time = executionTimePlanned(cpu_cores,get_data_other_nodes,p_CPU)

    if cpu_cores == 0.0 and gpu_cores != 0.0 and arm_cores == 0.0:
        logging.info("Execution time with GPU. Cores: "+str(gpu_cores)+". Dependencies: "+str(get_data_other_nodes))
        time = executionTimePlanned(gpu_cores,get_data_other_nodes,p_GPU)

    if cpu_cores == 0.0 and gpu_cores == 0.0 and arm_cores != 0.0:
        logging.info("Execution time with ARM. Cores: "+str(arm_cores)+". Dependencies: "+str(get_data_other_nodes))
        time = executionTimePlanned(arm_cores,get_data_other_nodes,p_ARM)

    logging.info("Node load: "+str(node_load))
    logging.info("Total execution time depending on node_load is "+str((1.0+node_load)*time))
    return (1.0+node_load)*time


# Because I do not know if planned behaviour for CPU/ARM/GPU is correct, I repeat code. If CPU/ARM/GPU influences in other variables, there is not a problem. In other case, we can bind
# this functions in a single function
# For a simulation, I use `getRandomTime()`, which return random data which has a normal distribution

# 1) Do I need data from other nodes?-->YES: For each node I get time spent in operations with other node (recursive call)
#                                    -->NO: No time is spent in this operation
# 2) Time spent with operations within node: It is a parallel program:
#   2.1) I have all data I need within node--> I get all data I need depending on function (important because in this way I discriminate data storaged within node)
#   2.2) I know what I must run, then I do that

def executionTimePlanned(cpu_cores,get_data_other_nodes,p_hardware):
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

    tExecutingFunction = (tAccessData+tProcessingData) / (cpu_cores**p_hardware)

    return (tExecutingFunction + t_i_j_final + t_j_i_final + time_other_nodes_final)

# Time spent getting data within node in which function is executed
def getTAccessData(my_function):
    # IMPLEMENTAR MODELO. ACCEDER A LOS DATOS. SE SUPONEN TODOS LOS DAROS NECESARIOS DENTRO DEL NODO
    return None

# Time spent processing data within node. Previously this data has been got
def tProcessingData(my_function):

    init = time.time()
    # Aquí se ejecuta 'my_function'. Se puede hacer porque todos los datos están a mano, accesibles dentro del nodo
    try:
        subprocess.check_output(my_function, shell=True, text=True)
    except subprocess.CalledProcessError as e:
        logging.error("Error in tProcessingData: "+str(e))

    end = time.time()
    logging.info("Function "+str(my_function)+" has been processed")

    return (end-init)

# Time spent communicating with other node. It is a prototype, but distance_i_j and bandwith are not constants
def tCommunication(node_i,node_j):
    distance_i_j=10000  # m
    bandwith = 50000   # MB/s
    logging.info("Communication time from node "+str(node_i)+" to "+str(node_j)+" is "+str(distance_i_j/bandswith))
    return (distance_i_j/bandswith)  # s
# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------- ENERGY CONSUMPTION MODULE ------------------------------------------------------------------------------------------------------

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getEnergyConsumptionPlanning(cpu_cores,gpu_cores,arm_cores,get_data_other_nodes,node_load):
    energy=0.0
    if cpu_cores != 0.0 and gpu_cores == 0.0 and arm_cores == 0.0:
        logging.info("Energy planned with CPU. Cores: "+str(cpu_cores)+". Dependencies: "+str(get_data_other_nodes))
        energy = energyPlanned(cpu_cores,get_data_other_nodes,p_CPU)
    
    if cpu_cores == 0.0 and gpu_cores != 0.0 and arm_cores == 0.0:
        logging.info("Energy planned with GPU. Cores: "+str(gpu_cores)+". Dependencies: "+str(get_data_other_nodes))
        energy = energyPlanned(gpu_cores,get_data_other_nodes,p_GPU)
   
    if cpu_cores == 0.0 and gpu_cores == 0.0 and arm_cores != 0.0:
        logging.info("Energy planned with ARM. Cores: "+str(arm_cores)+". Dependencies: "+str(get_data_other_nodes))
        energy = energyPlanned(arm_cores,get_data_other_nodes,p_ARM)

    logging.info("Node load: "+str(node_load))
    logging.info("Total energy consumption depending on node_load is "+str((1.0+node_load)*energy))
    return (1.0+node_load)*energy


def energyPlanned(cpu_cores,get_data_other_nodes,p_hardware):
    # The same but energy with CPU
    EnWaitingNode = 0.0
    EnConsTransmission = 0.0

    for node in get_data_other_nodes:
        # While this loop is running, EnWaitingNode should increase
        EnConsTransmission = EnConsTransmission + getRandomEnergy()
        # Here this thread should be waiting to another thread work
        EnWaitingNode = EnWaitingNode + getRandomEnergy()   # It could be modelised with a semaphore or monitor. IT DEPEND ON EXECUTION TIME IN THE FOREIGN NODE
        # IF WE SHOULD TAKE INTO ACCOUNT ENERGY IN OTHER NODE, WE SHOULD DO IT HERE.

    EnConsumptionProcessing = getRandomEnergy() * (cpu_cores**p_hardware)

    return (EnConsumptionProcessing+EnConsTransmission+EnWaitingNode)

# --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ----------------------------------------------------------------------------INPUT AUXILIAR FUNCTIONS -----------------------------------------------------------------------------------------
def reading_flags_given():
    parser = argparse.ArgumentParser(description='Processing flags')
    parser.add_argument('--reload', type=str, choices=['True', 'False'], required=True, help='Specify if flag is True or False')
    parser.add_argument('--features', type=str, help='Path to the file containing JSON string with features (optional)')
    parser.add_argument('--exec', action='store_true', help='Include to execute (optional)')

    args = parser.parse_args()

    reload_value = args.reload == 'True'

    if reload_value:
        if args.exec:
            raise ValueError("Error: --exec cannot be used when --reload is True.")
        if not args.features:
            raise ValueError("Error: --features is required when --reload is True.")
    else:
        if args.features:
            raise ValueError("Error: --features cannot be used when --reload is False.")
        if not args.exec:
            raise ValueError("Error: --exec is required when --reload is False")

    features_content = None
    if args.features:
        with open(args.features, 'r') as file:
            features_content = json.load(file)

    return reload_value, features_content, args.exec

def upload_new_features(features):

    # It is supposed that if Spain node es 1, then position in this array is 0, if Japan node is 2, position in this array is 1, ...
    for node_dict in features:
        if not isinstance(node_dict, dict):
            print("Error: each element must be a dictionary")
            exit(-1)

        if all(key in node_dict for key in ["CPU", "GPU", "ARM", "LOAD"]):
            max_cpus_in_each_node.append(node_dict["CPU"])
            max_gpus_in_each_node.append(node_dict["GPU"])
            max_arms_in_each_node.append(node_dict["ARM"])
            if not (0.0 <= node_dict["LOAD"] <= 1.0):
                raise ValueError("LOAD must be a real number in [0,1]")
            load_in_each_node.append(node_dict["LOAD"])
            transmission_bandswith.append(node_dict["CONNECTIONS"])
            data_avaliable.append(node_dict["DATA"])
        else:
            print("Error: faltan claves en el diccionario.")
            exit(-1)

# INPUT: object that represents a MOEA problem
# RETURN: MOEA problem with functions must be runned set

def setting_functions_to_run(moea_problem,functions):
    ### AQUÍ VA RELLENAR LA LISTA DE FUNCIONES A EJECUTAR. VAMOS A SUPONER QUE FORMA PARTE DEL MOEA. SI INICIALIZO Y DEVUELVO EL OBJETO, NO ES BUENO, PUES DEVUELVO PUNTERO A OBJETO DESTRUIDO SI SE INICIALIZA LOCALMENTE
    ### POSIBLE SOLUCIÓN: RECIBIR EL OBJETO INICIALIZADO Y CREAR ALGÚN SET EN LA CLASE DEL MOEA
    print(functions)
    moea_problem.setFunctionsToRun(functions)

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ---------------------------------------------------------------------------- MAIN FUNCTION -------------------------------------------------------------------------------------------------

### INPUT: python moea_problem_broker.py --reload <True/False> --features <File_in_JSON_style> --exec <File_in_JSON_style> (POR AHORA ESTA ÚLTIMA NO ESTÁ IMPLEMENTADA)

if __name__ == "__main__":
    
    # First function is got
    if len(sys.argv) > 1:
        reloading_system,features,functions = reading_flags_given()

        if reloading_system:
            max_node_in_graph = len(features)
            upload_new_features(features) 
        else:
            # An instance of our problem
            problem = MOEAforbroker(N_functions_tuplas = 2, P_decision_var = 3)

            # What functions we want to run
            setting_functions_to_run(problem,functions)

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
    else:
        print("At least one function must be given")
        exit(-1)


# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
