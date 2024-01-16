import numpy as np

P_variables_decision = 3
M_nodos_sistema = 10

def rellenarLista(lista=[]):

    for i in range(P_variables_decision * M_nodos_sistema):
        node_number = (i // P_variables_decision) + 1
        variable_number = i % P_variables_decision+1
        key = f"Nodo {node_number}. Variable decision {variable_number}"
        value = np.random.randint(1, 11)
        lista.append({key: value})


def obtenerDeNodoNVariableK(lista,N_nodo,K_variable):
    return lista[P_variables_decision*(N_nodo-1) + (K_variable-1)]

mi_lista = []

rellenarLista(mi_lista)

iteraciones = 5

print("La lista de diccionarios es la siguiente: ")
print(mi_lista)
print("\n")

for i in range(iteraciones):
    num_nodo = np.random.randint(1,M_nodos_sistema)
    k = np.random.randint(1,P_variables_decision)

    print("Del nodo "+str(num_nodo)+" escogemos la variable de decisión "+str(k))
    print(obtenerDeNodoNVariableK(mi_lista,num_nodo,k))