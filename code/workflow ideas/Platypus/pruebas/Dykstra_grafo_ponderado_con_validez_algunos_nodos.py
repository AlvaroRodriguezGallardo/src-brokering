import heapq
import numpy as np

# Simple example. In the real algorithm, we should know id for start node, and id for end node (iterative proccess, if I want D1, it is not in start node, then we should get which nodes have this data, run Dykstra algorithm and get which is the shortest path)
# Example: 3 nodes, and we want to go from node 1 to node 3
# From start_node to end_node is a path, and we want to go back to start_node. In this case, we set start_node as end_node and vice versa

lista_con_datos = [["D1","D2"],["D2"],["D3","D4","D5"],["D4","D5"],["D7"],["D1","D3"],["D6","D7","D8"],["D1"],["D10"],["D8","D9"]]

graph = [
    [0.0, 2.0, -1.0, -1.0, -1.0, -1.0, 7.0, -1.0, -1.0, -1.0],
    [2.0, 0.0, 3.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0],
    [-1.0, 3.0, 0.0, 4.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0],
    [-1.0, -1.0, 4.0, 0.0, 1.0, -1.0, -1.0, -1.0, -1.0, -1.0],
    [-1.0, -1.0, -1.0, 1.0, 0.0, 2.0, -1.0, -1.0, -1.0, -1.0],
    [-1.0, -1.0, -1.0, -1.0, 2.0, 0.0, 3.0, -1.0, -1.0, -1.0],
    [7.0, -1.0, -1.0, -1.0, -1.0, 3.0, 0.0, 4.0, -1.0, -1.0],
    [-1.0, -1.0, -1.0, -1.0, -1.0, -1.0, 4.0, 0.0, -1.0, -1.0],
    [-1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, 0.0, 6.0],
    [-1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, 6.0, 0.0],
]

def getNodesWithDatablock(datablock,lista_con_datos,lista_candidatos=[]):
    cont = 1
    for p in lista_con_datos:
        if datablock in p:
            lista_candidatos.append(cont)
        cont = cont + 1
    
    return lista_candidatos

def inverseProblem(graph_system,inverse_graph_system):
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

# start: Node I want to start
# graph: Graph of the system, it is a matrix like 'graph'
# end: Node I want to go to
def DykstraAlgorithm(start,graph,end):
    n = len(graph)
    distances = [float('inf')] * n
    distances[start] = 0
    queue = [(0, start)]
    inverse_graph_system = []
    inverseProblem(graph,inverse_graph_system)
    #inverse_graph_system = graph
    
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


start_node = 1

examples_datablocks_needed = ["D2","D3","D5","D10","D12"]

print("Testing Dykstra Algorithm with some constraints")

for data in examples_datablocks_needed:
    print("\nDATABLOCK "+str(data))
    lista_candidatos = []
    lista_distancias = []
    getNodesWithDatablock(data,lista_con_datos,lista_candidatos)

    for an_end_node in lista_candidatos:
        lista_distancias.append(DykstraAlgorithm(start_node-1,graph,an_end_node-1))
        print("Node "+str(start_node)+" to node "+str(an_end_node)+" has this distance: "+str(DykstraAlgorithm(start_node-1,graph,an_end_node-1)))
    
    if lista_distancias:
        end_node = lista_distancias.index(min(lista_distancias))+1
        min_distance = lista_distancias[end_node-1]
    else:
        min_distance = float('inf')

    if min_distance == 0:
        print("Datablock "+str(data)+" is within node "+str(start_node))
    elif min_distance == float('inf'):
        print("Datablock "+str(data)+" can not be found within connected nodes, so we can not use it")
    else:
        print("For datablock "+str(data)+" the minimum distance to get it from node "+str(start_node)+" is to node "+str(end_node)+" with a distance of "+str(min_distance))
    
