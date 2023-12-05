**We have the following problem**: We have N functions, $X_1,...,X_N$, and we want to execute a workflow optimising parameters like execution time and energy consumption. Broker receives this functions and it wants to minimise parameters mentioned, selecting in which node that function should be executed. I suppose M nodes, and I note node j $\forall$ j=1,...,M

For each function, we say, $X_i$ where $i=1,...,N$, it gets as reference values if that function is executed in CPU. It makes a decision depending on what function needs to being executed. Some restrictions are:
- $X_i$ needs GPU: Energy consumption increases but execution time decreases, depending on given performance. However, using ARM it reduces energy consumption penalty.
- $X_i$: needs software inside the node: If answer is not, then we have a penalty because of downloads needed.
- Node load: higher load (betwenn 0 and 1) implies an incrementation in execution time and energy consumption.
- More cores in CPU/GPU implies less execution time but more energy consumption.

After assessing restrictions above, broker should decide in which node must be executed $X_i$

Note that time spent transferring data from other nodes has a particular behaviour, but it is going to be simulated as a linear function, trying to minimise slope.

Some schemas with supposed workflows of broker decisions will be upload here. With them, problem should be modeled, and lastly we automate it with a MOEA.

I suppose firstly that functions are independent. It means, $X_i$ does not depend on $X_i$ results, where $i \neq j$, i,j=1,...,N. In a future, we can introduces dependencies and problem should be treated with a graph as an input, where vertexs are functions and aristas are dependencies between functions.

Here I have a first approximation to the decision problem, made in Draw.io

![DiagramaMOEAbecaJAE drawio](https://github.com/AlvaroRodriguezGallardo/src-brokering/assets/80212790/1efc70fd-3dce-447d-8423-5287a2288714)

In the next lines, I will be explaining my hypothesis about how objetive functions can be modeled:

## Execution time in CPU (no GPU required)

We say #A is cardinal of set A. In other words, number of elements within A.

Firsty I suppose transfer time between nodes independent (if we have dependencies, like in a graph, them there are implicit functions and it complicates our problem). Now, it is supposed a paralel execution, in which nCores cores in CPU have an uniform distribution (i.e., work is distributed uniformly). With that, I denote A a set where there are indexs of another nodes with needed data but are not the node in which execution is being done (even that, an access time exists with data in the same node). If $tTransf_j$ is time spent transferring data from node $j \in A$, then time needed to transferring data from other nodes is $$totalTimeTransf = \frac{1}{nCores}\sum_{j \in A} tTransf_j$$ With access time, then execution time in CPU is $$tEjec = tAccessData + totalTimeTransf$$

Now I am going to make a little analysis. Transfer time is independent between nodes (in other case, there are implicit functions, and that problems should be solved before executing this function). We have two cases:

 - If nCores is fixed, then we have a straight with #A variables. In other words, we are working in a #A-dimensional space.
 - If nCores is variable, we say $nCores \in \mathbb{N}$, then we have a #A+1-dimensional function, with a vertical asymptote in n_cores=0. As we need at minimum one core in CPU, then it is not now a problem (but yes with GPU).

Summarizing, becuase of assuming n_cores variable is not a problem (n_cores is not 0 in CPU) then we have a function with asymptotic behaviour, but we can think in it like a linear behaviour depending on time. We have #A+2 variables.

Now, it is assumed there is transmission time. I think it is not difficult to consider node bandwith (same units, for example, MB/s). Let $X_i$. $X_j$, and a function should be executed in $X_i$. Besides, $X_i$ needs some information in $X_j$. We denote $V_i$, $V_j$ bandwiths of both nodes, and $d_ij$ distance between them. We know (I guess) $V = \div{d,t}$, and we have that transmission time for node $X_i$ to $X_j$ is $t_{ij}$, and $t_{ji}$ for the other case. We can calculate $$t_{ij}=\frac{d_{ij}}{V_{ij}}$$ $$t_{ji}=\frac{d_{ji}}{V_{ji}}$$. As consequence, execution time in CPU is $$tEjec = tAccessData + \frac{1}{nCores}\sum_{j \in A} tTransf_j + \sum_{j \in A} t_{ij} + \sum_{j \in A} t_{ji}$$ where i is node index in which it it supposed to be execute the function, $i \neq j$, and assuming different bandwiths, then $t_{ij} \neq t_{ji}$.

However, it is an ideal situation. Node i is connected with other nodes, and they have the same behaviour as node i, so they will have an access time, transmission time with other nodes if it needs information in another node... We can suppose node j can need data from node i, and with next expression we do not add extra time (and it is not an eternal loop because in a moment, node i should not need more data from node j), and the reason is, if node j need data from node i, then it will have a transmission time too, independiently if node i has called node j previously. Because of this, function that models execution time can be $$tEjec = tAccessData + \frac{1}{nCores}\sum_{j \in A} tTransf_j + \sum_{j \in A} t_{ij} + \sum_{j \in A} t_{ji} + \sum_{j \in A} tEjec_j$$

Note transmission time is duplicated. If node i needs data from node j, then we have a $t_{ij}$. But $t_{ji} is implicit in the recursive function like transmission time from node j to i. Recursive function represents time node i needs to wait to receive data needed from node j, so transmission time, $t_{ji} is within it. So, proposed function is $$tEjec = tAccessData + \frac{1}{nCores}\sum_{j \in A} tTransf_j + \sum_{j \in A} t_{ij} + \sum_{j \in A} tEjec_j$$

## Execution time in general.

As I discuss in this [pdf](https://github.com/AlvaroRodriguezGallardo/src-brokering/blob/main/docs/broker/MOEA/Workflow%20ideas/Discusion_uso_1_n_p.pdf), it is proposed function $frac{1}{{n^p}}$ generally, where n is number of cores (even if it is writen like n, it can be a rational number) and it is fixed p depending on hardware technology. For example, in CPU, as it was modeled previously, then p=1. For GPU, p>1, for example p=3, but the exact value should be studied thoroughly.

Summarising, we can abstract execution time expression as the next one $$tEjec = tAccessData + \frac{1}{nCores^p}\sum_{j \in A} tTransf_j + \sum_{j \in A} t_{ij} + \sum_{j \in A} t_{ji} + \sum_{j \in A} tEjec_j$$


## Energy consumption with CPU (no GPU).

First of all, I expose situations in which there is an increment of energy consumption:

- More cores $\implies$ more energy consumption.
- More data to process $\implies$ more energy consumption (depending on the algorithm, energy consumption increases).
- Do I need to convey data to other nodes? If yes $\implies$ more energy consumption.
- Do I need data from other nodes? If yes $\implies$ more energy consumption (because while I am waiting, I consume energy).

It is supposed we want a function that models energy consumption in general, so function must take into account energy consumption of foreign nodes. We use the same set A mentioned above. Then a possible function can be $$EnConsumption=EnConsumptionProcessing + \sum_{j \in A} EnConsTransmission_{ij} + \sum_{j \in A} EnWaitingNode_j$$. Here, we have energy consumption in processing data (it includes algorithms used within node, access to data within node,..., it is a variable that must be studied thoroughly). We also have a variable that represents energy spend in transmission operations. Then, as it was hypothesized, if node i needs data from other nodes, then it must wait to execution in other nodes, so although consumption in node i does not depend on consumption in other nodes, it depends on how much time node i must wait to operations in other nodes, it must be active I guess(**I think I have found a dependence between execution time and energy consumption**).

Note that function above does not have explicitly number of cores. It may be studied before. In time it was considered successions of functions $\{\frac{1}{x^p}\}$. Although $\{x^p\}$ where $p \in \mathbb{N}$ is an option, and fulfills restrictions on energy consumption in CPU/GPU/ARM, or other hardware componentes, I do not know if cores function should have a $x^p$ behaviour.

## Energy consumption generally.

I have thought in three options:
- If $f$ is function that models execution time, then as I have understood, then energy consumption has an inverse behaviour. So intuitively it can be thought we should get a function, let g, with which $f \circ g = (x_1,...,x_p)$, where f has p variables. In other words, $g=f^{-1}$. However, in expression of f (we call it $tEjec$), none variable can be cleared, that represents energy consumption (of course, because it has been supposed, and I think it is real, that are independent variables). Besides, because of implicit functions it is not a feasible option (we do not know how much data from other nodes is needed, so it can be hard to find a good explicit expression).
- We know $f$ can not be 0, and energy consumption seems to have an inverse behaviour. In this case, and because it seems that energy consumption has the same variables as execution time, but with inverse behaviour, then it is proposed that, if g represents energy consumption, then $g=(f)^{-1}=\frac{1}{f}$. It is an option, but I think not the best (surely other variables or some situations are not taken into account).
- Trying to modelise energy consumption as it was made with execution time. In this case, CPU and GPU has an inverse behaviour from exection time, and I think that behaviour is different in this case, so it must be studied thoroughly. I will try to unify hardware behaviour as I did in execution time, studying successions of functions and proposing them as a feasible option.
