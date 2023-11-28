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
