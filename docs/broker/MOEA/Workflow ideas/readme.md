**We have the following problem**: We have N functions, $X_1,...,X_N$, and we want to execute a workflow optimising parameters like execution time and energy consumption. Broker receives this functions and it wants to minimise parameters mentioned. 
For each function, we say, $X_i$ where $i=1,...,N$, it gets as reference values if that function is executed in CPU. It makes a decision depending on what function needs to being executed. Some restrictions are:
- $X_i$ needs GPU: Energy consumption increases but execution time decreases, depending on given performance. However, using ARM it reduces energy consumption penalty.
- $X_i$: needs software inside the node: If answer is not, then we have a penalty because of downloads needed.
- Node load: higher load (betwenn 0 and 1) implies an incrementation in execution time and energy consumption.
- More cores in CPU/GPU implies less execution time but more energy consumption.

  After assessing restrictions above, broker should decide in which node must be executed $X_i$
