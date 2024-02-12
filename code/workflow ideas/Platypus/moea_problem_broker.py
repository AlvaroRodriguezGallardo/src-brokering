from platypus import NSGAII,SPEA2,MOEAD,CMAES,OMOPSO,IBEA, Problem, Real,Integer   # Differential evolution algorithm? OMOPSO algorithm?
import numpy as np
import random
import matplotlib.pyplot as plt
import sys # Getting function, and sys.maxsize
import time
import subprocess
import json
import argparse
import logging
import heapq
import copy  
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s') 
# For execution time, we use expression {1/(n_cores)^p}, where p depemds on hardware technology used, i.e, p_CPU < p_ARM < p_GPU. Justification is explained in https://github.com/AlvaroRodriguezGallardo/src-brokering/blob/main/docs/broker/MOEA/broker_optimisation_algorithm.pdf

# It is an example for simulation. It should be chosen using experiments with real data
p_CPU = 1
p_ARM = 2
p_GPU = 3
N_execution_plannings = 1 # It could generalise to a array of dictionaries but functions must be tight

# Graph features
max_node_in_graph = 0
graph_system = []  # grap_system[i][j] is a float. If it is -1.0, then i is not connected to j. Besides, if it is 0.0, then i==j. List of lists!!!
data_avaliable = []             # List of lists (string)

# Nodes feautres
max_cpus_in_each_node = []
max_gpus_in_each_node = []
max_arms_in_each_node = []
load_in_each_node = []

# Number of decision variables
NUMBER_CPU = 1
NUMBER_GPU = 2
NUMBER_ARM = 3

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
        self.types.append(Integer(1,max_node_in_graph))
        for i in range(max_node_in_graph):
            self.types.append(Integer(0, max_cpus_in_each_node[i]))     # En vez de "cierto porcentaje de", usamos como plan de ejecución el número de cores correspondiente a ese porcentaje
            self.types.append(Integer(0, max_gpus_in_each_node[i]))
            self.types.append(Integer(0, max_arms_in_each_node[i]))
    
        # Some constraints are defined:  they can not be zero at the same time (1)
        # Platypus logic in manually implemented constraints: solution is valid if it returns a value <=0
                                                                                #*******************************************************************************************************************
        self.constraints[:] = [not_zero_at_same_time] #*********** NOTA: Puede haber propuestas en que un nodo use CPU y GPU (ejemplo) según cierto porcentaje, así que hay que cambiar esto último*******
                                                                                #*********************************************************************************************************************
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
# NOT IN USE, IT COULD BE DELETED
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

# Let an execution planning in a node, with a 3-upla (cpu_cores,gpu_cores,arm_cores). It is supposed an uniform distribution

# CPU: 3, GPU: 4 ARM: 3 --> SUMA=10
# 3/10-->cpu
# 4/10 -->gpu
# 3/10 -->arm

def inferredTimeOnNumberOfCores(time,cpu_cores,gpu_cores,arm_cores):
    total_cores = cpu_cores+gpu_cores+arm_cores

    distribution_cpu = (1.0)*cpu_cores/total_cores
    distribution_gpu = (1.0)*gpu_cores/total_cores
    distribution_arm = (1.0)*arm_cores/total_cores

    time_cpu = (1.0/(distribution_cpu)**p_CPU) * time
    time_gpu = (1.0/(distribution_gpu)**p_GPU) * time
    time_arm = (1.0/(distribution_arm)**p_ARM) * time

    return (time_cpu+time_gpu+time_arm)

def inferredEnergyOnNumberOfCores(energy,cpu_cores,gpu_cores,arm_cores):
    total_cores = cpu_cores+gpu_cores+arm_cores

    distribution_cpu = (1.0)*cpu_cores/total_cores
    distribution_gpu = (1.0)*gpu_cores/total_cores
    distribution_arm = (1.0)*arm_cores/total_cores

    energy_cpu = (distribution_cpu**p_CPU) * energy
    energy_gpu = (distribution_gpu**p_GPU) * energy
    energy_arm = (distribution_arm**p_ARM) * energy

    return (energy_cpu+energy_gpu+energy_arm)

def getDataNeededForAFunctionWithinANode(id_nodo,function):
    # ONLY FOR TESTING, NOT A FINAL IMPLEMENTATION
    d_needed = []
    n_data_blocks = 10
    max_neded = random.randint(0,5)

    for i in range(max_neded):
        p = random.randint(1,n_data_blocks)
        if p != id_nodo
            d_needed.append("D"+str(p))

    return d_needed     # RETURNING A POINTER !!!!

# NOT IN USE, IT COULD BE DELETED
def data_block_within_node_i(node_i,data_block):
    data_in_node_i = data_avaliable[node_i-1]

    for p in data_in_node_i:
        if p == data_block:
            return True
    return False

def getNodesWithDatablock(datablock,lista_candidatos=[]):
    cont = 1
    for p in data_avaliable:
        if datablock in p:
            lista_candidatos.append(cont)
        cont = cont + 1
    
    return lista_candidatos

def inverseProblem(inverse_graph_system):
    n = len(graph_system)
    for i in range(0,n):
        row = []
        for j in range(0,n):
            if graph_system[i][j] != 0:
                row.append(1.0/graph_system[i][j])
            else:
                row.append(0.0)

        inverse_graph_system.append(row)

    return inverse_graph_system

def DykstraAlgorithm(start,end):
    n = len(graph)
    distances = [float('inf')] * n
    distances[start] = 0
    queue = [(0, start)]
    inverse_graph_system = []
    inverseProblem(inverse_graph_system)

    while queue:
        dist, current = heapq.heappop(queue)

        if current == end:
            return dist

        for neighbor in range(n):
            if inverse_graph_system[current][neighbor] != -1.0:
                distance_to_neighbor = dist + inverse_graph_system[current][neighbor]
                if distance_to_neighbor < distances[neighbor]:
                    distances[neighbor] = distance_to_neighbor
                    heapq.heappush(queue, (distance_to_neighbor, neighbor))

    return float('inf')

# Time spent communicating with other node. It is a prototype, but distance_i_j and bandwith are not constants
def getTCommunicationMinimo(id_nodo,nodes_needed_for_a_datablock):
    # COMPLETAR: Algoritmo de Dijkstra. Distancia mínima. Si es 0, son el mismo, si devuelve inf no están conectados
    distances = []

    for an_end_node in nodes_needed_for_a_datablock:
        distances.append(DykstraAlgorithm(id_nodo-1,an_end_node-1))

    if distances:
        end_node = lista_distancias.index(min(lista_distancias))+1
        min_distance = lista_distancias[end_node-1]
    else:
        min_distance = float('inf')
        end_node = -1

    if min_distance == float('inf'):
        end_node = -1
    
    return min_distance, end_node

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
    id_nodo = values[0]
    my_planning = values[1:]
    cpu_cores = obtenerDeNodoNVariableK(my_planning,id_nodo,NUMBER_CPU)                         # double
    gpu_cores = obtenerDeNodoNVariableK(my_planning,id_nodo,NUMBER_GPU)                        # double. If gpu_cores==0, then it is supposed GPU is not needed
    arm_cores = obtenerDeNodoNVariableK(my_planning,id_nodo,NUMBER_ARM)                             # double

    data_needed = getDataNeededForAFunctionWithinANode(id_nodo,my_function)
    # or if I want to execute 'my_function', get dependencies

   # assert cpu_cores>0, "Specify how many cores you want to run in CPU"
    node_load = random.uniform(0.0,1.0)

    t_execution_planning = getExecutionTimePlanning(id_nodo=id_nodo,data_needed=data_needed,node_load=node_load,planning=my_planning)
    energy_consumption = getEnergyConsumptionPlanning(id_nodo=id_nodo,data_needed=data_needed,node_load=node_load,planning=my_planning)
 
    return t_execution_planning,energy_consumption

# ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# ------------------------------------------------------------------------- EXECUTION TIME MODULE ----------------------------------------------------------------------------------------
# In this problem, it is supposed VARIABLES ARE INDEPENDENT, EVEN IF SOME SOLUTIONS CONSIDER THEM AS RANDOM VARIABLES

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If arm_cores==0, then ARM will not be needed
#   - It is supposed hardware technology is exclusive (i.e. if ARM is used, then CPU and GPU are not used)
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getExecutionTimePlanning(id_nodo,data_needed,node_load,planning):
    logging.info("Execution time with a planning. CPU cores: "+str(cpu_cores)+", GPU cores: "+str(gpu_cores)+" and ARM cores: "+str(arm_cores))
    
    time = executionTimePlanned(id_nodo,get_data_other_nodes,planning)

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
#   2.2) I know wha t I must run, then I do that

def executionTimePlanned(id_nodo,data_needed,planning):
    #Here I define an approach function to cpu time
        # Now, I do the same with transmission time

    t_i_j_final = 0.0
    t_j_i_final = 0.0
    time_other_nodes_final = 0.0

    if(len(data_needed)>0):    # Only if data from other nodes is needed we have to consider this time
        t_i_j=0.0
        t_j_i = 0.0
        nodes_needed = []
        for data_block in data_needed:
            nodes_needed_locally = []   # Usado 'localmente' para cierto bloque de datos, a diferencia del 'nodes_needed', que se usará para estimar el tiempo de ejecución en ese nodo
            getNodesWithDatablock(data_block,nodes_needed_locally)

            time,id = getTCommunicationMinimo(id_nodo,nodes_needed_locally) # Aquí está la crema del algoritmo. Dykstra y camino mínimo de los mínimos
        
            if id!=-1:
                nodes_needed.append(id)     # Si id_nodo==id, no suma al tiempo de transmisión, pero sí se tiene en cuenta para el tiempo de procesamiento (dentro del mismo nodo, no necesita comunicación, pero sí procesar datos)
            else:
                time = sys.maxsize  # Penalización por no poder conectar con el nodo necesario para el datablock requerido

            t_i_j = t_i_j + time # Ese tiempo mínimo de los mínimos es el que tomo, y el id al nodo. Si id == -1, entonces no está conectado, y devuelve time=inf

        t_i_j_final = t_i_j

        for id in nodes_needed:
            time,_ = getTCommunicationMinimo(id,-1,[id_nodo])   # Solo devolver tiempo comunicación nodo más cercano con el anterior data_block al nodo actual. Caso particular del anterior
            t_j_i = t_j_i + time                                # Pongo [id_nodo] para reutilizar la función y que reciba las estructuras de datos como espera manejarlas

        t_j_i_final = t_j_i

        proccess_time = 0.0
        for id in nodes_needed:
            if id != id_nodo:
                time = getExecutionTimePlanning(id,[],load_in_each_node[id-1],planning) # Se supone por simplicidad que si llama a un nodo, este es el que devuelve Dijkstra con el data_block necesario
                proccess_time = proccess_time + time

        time_other_nodes_final = proccess_time
               
    # We process data within node

    # Then I get data within node. In this function we have data needed from other nodes
    tAccessData =getTAccessData('wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms')
    tProcessingData = getTProcessingData('wsclean -size 3072 3072 -scale 0.7amin -niter 10000 -mgain 0.8 -auto-threshold 3 obs.ms')

    #tExecutingFunction = (tAccessData+tProcessingData) / (cpu_cores**p_hardware)

    tExecutingFunction = inferredTimeOnNumberOfCores(tAccessData+tProcessingData,obtenerDeNodoNVariableK(planning,id_nodo,NUMBER_CPU),obtenerDeNodoNVariableK(planning,id_nodo,NUMBER_GPU),obtenerDeNodoNVariableK(planning,id_nodo,NUMBER_ARM))

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

# -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#----------------------------------------------------------------- ENERGY CONSUMPTION MODULE ------------------------------------------------------------------------------------------------------

# Some restrictions:
#   - If gpu_cores==0, then GPU will not be needed
#   - If get_data_other_nodes.isEmpty() then needed data will be within node.

def getEnergyConsumptionPlanning(id_nodo,data_needed,node_load,planning):
    energy = energyPlanned(id_nodo,data_needed,planning)

    logging.info("Node load: "+str(node_load))
    logging.info("Total energy consumption depending on node_load is "+str((1.0+node_load)*energy))
    return (1.0+node_load)*energy


def energyPlanned(id_nodo,data_needed,planning):
    EnWaitingNode = 0.0
    EnConsTransmission = 0.0
    EnOtherNodes = 0.0

    for data in data_needed:
        # While this loop is running, EnWaitingNode should increase
        EnConsTransmission = EnConsTransmission + getRandomEnergy()
        # Here this thread should be waiting to another thread work
        EnWaitingNode = EnWaitingNode + getRandomEnergy()   # It could be modelised with a semaphore or monitor. IT DEPENDS ON EXECUTION TIME IN THE FOREIGN NODE
        
        nodes_needed_locally = []

        getNodesWithDatablock(data,nodes_needed_locally)

        _, id = getTCommunicationMinimo(id_nodo,nodes_needed_locally)

        energy = 0.0
        if id == -1:
            energy = sys.maxsize
        elif id != id_nodo:
            energy = getEnergyConsumptionPlanning(id,[],load_in_each_node[id-1],planning)     
        
        EnOtherNodes = EnOtherNodes + energy


    EnConsumptionProcessing = inferredEnergyOnNumberOfCores(getRandomEnergy(),obtenerDeNodoNVariableK(planning,id_nodo,NUMBER_CPU),obtenerDeNodoNVariableK(planning,id_nodo,NUMBER_GPU),obtenerDeNodoNVariableK(planning,id_nodo,NUMBER_ARM))

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
      #  if args.exec:
      #      raise ValueError("Error: --exec cannot be used when --reload is True.")
        if not args.features:
            raise ValueError("Error: --features is required when --reload is True.")
    else:
     #   if args.features:
     #       raise ValueError("Error: --features cannot be used when --reload is False.")
        if not args.exec:
            raise ValueError("Error: --exec is required when --reload is False")

    features_content = None
    if args.features:
        with open(args.features, 'r') as file:
            features_content = json.load(file)

    return reload_value, features_content, args.exec

# ID \in [1,max_nodes]

def upload_new_features(features):
    # It is supposed that if Spain node es 1, then position in this array is 0, if Japan node is 2, position in this array is 1, ...
    for node_dict in features:
        if not isinstance(node_dict, dict):
            print("Error: each element must be a dictionary")
            exit(-1)

        if all(key in node_dict for key in ["ID","CPU", "GPU", "ARM", "LOAD"]):
            max_cpus_in_each_node.append(node_dict["CPU"])
            max_gpus_in_each_node.append(node_dict["GPU"])
            max_arms_in_each_node.append(node_dict["ARM"])
            if not (0.0 <= node_dict["LOAD"] <= 1.0):
                raise ValueError("LOAD must be a real number in [0,1]")
            load_in_each_node.append(node_dict["LOAD"])
            resizing_connections_matrix(node_dict["ID"],node_dict["CONNECTIONS"])
            data_avaliable.append(node_dict["DATA"])
        else:
            print("Error: faltan claves en el diccionario.")
            exit(-1)

# INPUT:    id: it identifies a node within the graph
#           connections: list of dictionaries (for now) which represents bandwith with other nodes (consequently, if a node does not appear here, then it is not connected with 'id' node)
# OUTPUT:   None
# WARNING:  Python uses pointers, so functions like 'copy()' should be used
# It is supposed if a node has to be added, it is put at the end of the matrix, with the respective id
def resizing_connections_matrix(id,connections):
    previous_matrix = copy.deepcopy(graph_system)

    n_nodes = max(len(previous_matrix),get_max_id_node(connections))
    graph_system = []

    for i in range(0,n_nodes):
        aux = []
        if i == id-1:
            insert_connections_row_within_graph(i,n_nodes,connections)
        elif previous_matrix[i] is not None:        # If len(previous_matrix[i]) <= n_nodes, then we should add an array with n_nodes-len(previous_matrix[i]) length to full the list of possible connections, with -1.0 because it was not indicated the connections between them
            aux.append(previous_matrix[i])
            rest_of_them_aux = [-1.0] * (n_nodes-len(previous_matrix[i]))
            aux.append(rest_of_them_aux)

            graph_system[i] = copy.deepcopy(aux)
        else:
          ##  logging.info("You should not have executed this code in average conditions!!!")
            logging.info("It is supposed in a future connections with "+str(id)+" node are given")   # If it should be changed in a future, it will enter into the first conditional block (condition i==id-1)
            aux = [-1.0] * (n_nodes)
            graph_system[i] = copy.deepcopy(aux)

# Auxiliar function for 'resizing_connections_matrix'. Given a list of nodes, it returns the maximum id (it is supposed 'connections' could not be ordered)
def get_max_id_node(connections):
    max_id = connections[0][0]

    for p in connections:
        max_id = max(max_id,p[0])
    return max_id

def insert_connections_row_within_graph(i,n_nodes,connections):
    aux = [-1.0]*(n_nodes)
    aux[i] = 0.0

    id_nodes_with_connections = list(connections.keys())
    for j in range(n_nodes):        # j starts in 0 and goes to n_nodes-1
        if j+1 in id_nodes_with_connections:    # id_nodes_with_connections has elements between 1 and n_nodes
            aux[j] = connections[j][1]

    if graph_system[i] is not None: # Changing connections of a node that exists (example of use: a node has fallen)
        graph_system[i] = copy.deepcopy(aux)
    else:
        graph_system.append(copy.deepcopy(aux)) # Node i+1 did not exist within the graph

# INPUT: object that represents a MOEA problem
# RETURN: MOEA problem with functions must be runned set

def setting_functions_to_run(moea_problem,functions):
    ### AQUÍ VA RELLENAR LA LISTA DE FUNCIONES A EJECUTAR. VAMOS A SUPONER QUE FORMA PARTE DEL MOEA. SI INICIALIZO Y DEVUELVO EL OBJETO, NO ES BUENO, PUES DEVUELVO PUNTERO A OBJETO DESTRUIDO SI SE INICIALIZA LOCALMENTE
    ### POSIBLE SOLUCIÓN: RECIBIR EL OBJETO INICIALIZADO Y CREAR ALGÚN SET EN LA CLASE DEL MOEA
    print(functions)
    moea_problem.setFunctionsToRun(functions)

# INPUT: COMMAND WITH NECESSARY SOFTWARE, PARAMETERS AND DATA
# NOTA: Por ahora reducir los inputs a parámetros->flag --param, datos->flag --data, y así
def introduceFunction():
    print("Please, introduce a function to be run within the system")
    function_command=input("Function command")

    func = {
        command: ''
    }

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

            # An instance of our problem
            problem = MOEAforbroker(N_functions_tuplas = 2, P_decision_var = 3)

            # What functions we want to run
            if functions is not None:
                setting_functions_to_run(problem,functions)

            # Some algorithms we can execute, in an array
        # algorithms = [NSGAII(problem), SPEA2(problem), MOEAD(problem), CMAES(problem), IBEA(problem)]
            algorithms = [NSGAII(problem)]
            while(True):
                if functions is None:
                    func = introduceFunction()
                    setting_functions_to_run(problem,func)

                # SI QUEREMOS UN SISTEMA DINÁMICO, TAL QUE INTRODUZCO UNA FUNCIÓN Y SE REEVALÚA AL SISTEMA, SE PODRÍA LANZAR EL SIGUIENTE BUCLE COMO UN PROCESO APARTE, Y EL PRINCIPAL SE DEDICA A PEDIR FUNCIONES A LANZAR 
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






def copiaSeguridadMain():
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
