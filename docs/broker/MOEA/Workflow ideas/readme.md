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

Firsty I suppose transfer time between nodes independent (if we have dependencies, like in a graph, them there are implicit functions and it complicates our problem). Now, it is supposed a paralel execution, in which nCores cores in CPU have an uniform distribution (i.e., work is distributed uniformly). With that, I denote A a set where there are indexs of another nodes with needed data but are not the node in which execution is being done (even that, an access time exists with data in the same node). If $tTransf_j$ is time spent transferring data from node $j \in A$, then time needed to transferring data from other nodes is $$totalTimeTransf = \frac{1nCores}*\sum_{j \in A} tTransf_j$$ With access time, then execution time in CPU is $$tEjec = tAccessData + totalTimeTransf$$

Now I am going to make a little analysis. Transfer time is independent between nodes (in other case, there are implicit functions, and that problems should be solved before executing this function). We have two cases:

 - If nCores is fixed, then we have a straight with #A variables. In other words, we are working in a #A-dimensional space.
 - If nCores is variable, we say $nCores \in \mathbb{N}$, then we have a #A+1-dimensional function, with a vertical asymptote in n_cores=0. As we need at minimum one core in CPU, then it is not now a problem (but yes with GPU).

Summarizing, becuase of assuming n_cores variable is not a problem (n_cores is not 0 in CPU) then we have a function with asymptotic behaviour, but we can think in it like a linear behaviour depending on time. We have #A+2 variables.

Now, it is assumed there is transmission time. I think it is not difficult to consider node bandwith (same units, for example, MB/s). Let $X_i$. $X_j$, and a function should be executed in $X_i$. Besides, $X_i$ needs some information in $X_j$. We denote $V_i$, $V_j$ bandwiths of both nodes, and $d_ij$ distance between them. We know (I guess) $V = \div{d,t}$, and we have that transmission time for node $X_i$ to $X_j$ is $t_ij$, and $t_ji$ for the other case. We can calculate $$t_ij=\frac{V_i,d_ij}$$ $$t_ji=\frac{V_j,d_ji}$$. As consequence, execution time in CPU is $$tEjec = tAccessData$$ + $$\frac{1,nCores}*\sum_{j \in A} tTransf_j$$ + $$\sum{j \in A} t_ij$$ + $$\sum{j \in A} t_ji$$ where i is node index in which it it supposed to be execute the function, $i \neq j$, and assuming different bandwiths, then $t_ij \neq t_ji$
