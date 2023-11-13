# Studying about the broker

In this document, I will expose information a get about the broker which can be used in our distributed system. I will discuss what is the aim, and then I will write abou possible algorithms can be implmented. As our problem is a classification problem, I will research about machine learning algorithms, and libraries that can be used (in Python).

## Main aim

Supposed our system has been developed succesfully, we can have the next question: 'I have to use a flag to distinct cases, but I do not know nothing about the internal exection. How do I know if the chosen option is the best one?'. Because of this question, we have to develop a 'broker', which is a module of our system which knows about all system, internal executions, properties of the rest of modules,... This broker receives an order, and divides the problem in two parts:

- What does the user want to?---> Broker needs to interpret the comand or order given.
- Where should I execute this order if I want to optimise execution?--->Thanks to the last part, broker knows what the user wants, so how it knows about all system, as it was specificated before, it must face to a classification problem, and **decide** which is te best option in the way of optimising resources,time,... (optimitation problem with a vectorial field $f:\Omega\subset\mathbb{R^n} \to \mathbb{R^m}$ ?)

A wide range of algorithms can be used, but I will try to specificate the most interestings ones, depending in which problem I am:

### 1- What does the user want to?

Most algorithms can be used,. However, I think the most interesting can be:

- **RNN (Recurrent Neuronal Networks):** Inputs may not be independient from other inputs I guess, and they are good options to process natural language. However, because of their bad memory en time, LSTM (Long Short-Term Memory) and GRU (Gated Recurrent Units) should be better, both of them with satisfying results, but GRU are simpler than LSTM.
- **Transformers:** Recurrency is not needed, and models like GPT uses it, and we can use it as a pretrained algorithm. It is an interesting recent algorithm, **or even T5**. They learn about the context and with it, decisions are made. They are a type of neuronal network, and I think it is useful using them (we have to know what user wants to). No labels are needed, they relate mathematical expressions and with Internet, we do not have to use big datasets.
- **Decision trees:** We represent all possibilities and we know all consequences an action could have. They are simple, but we can have an overfitting with them.
- **Random forests:** A set of trained decision trees (we need to reduce the correlation between them). They make a vote and make a decision. We can manage overfitting and robustness, but resources need are high.
- **SVM (Support Vector Machine):** Powerful algorithm in which hiperplane which maximizes the distance between classes of a characteristics space. If we want a better behaviour we need to select a good kernel and make a good selection of parameter we have to optimise. In highly dimensional spaces, they are a good option. However, with knowledge I have now, I do not know how this algorithm can work effectivily in this step.

### 2- Where should I execute this order if I want to optimise execution?

Algorithms previously mentioned can be used, but I want to make an special mention to deep neuronal networks (DNN) generally, because in this step we have a classification problem, and this algorithm can manage high inputs, and this is important for considering, because of the size of inputs within our system (even exabytes of information).

Generally it could manage big datasets, and make good, even the optimal predictions. However, overfitting can appear, above all if training datasets are small. Besides, weitghts must be initialized in a good way if we want to make good predictions with the network. It is hard, so techniques proposed by Xavier or He could be used for that. Even hyperparameters are not a trivial selection.

We can see that DNN is a very powerful algorithm for classification, but they are not easy to implement. We have to make good decisions if we want to have the optimal execution. Hyperparameters, initial weigths, auxiliar algorithms,..., we need to choose well, and test a lot the network. Because of that, I can affirm it spends a wide range of resources.

![imagen](https://github.com/AlvaroRodriguezGallardo/src-brokering/assets/80212790/812a0ab7-6da5-435a-835c-e7af9d5099c1)

Here I compare a simple neuronal network with a DNN. Each vertical group is a level. The adjective 'deep' is because in DNN we have more than one level. If we only consider a theorical point of view, we will think that more levels implies better predictions and making complex prediction, and it may be true, but empirically it needs a lot of resources, and may not be a good solution, so we have to think about level too. High level implies better predictions, but it spends a wide range of resources and it is most likely to have an overfitting. In addition, robustness may be affect, because more neurons can be attacked.

On the other hand, I am going to explain more about MOEAs, in which we have the classical optimization problem with a vectorail field $F:\Omega \subset \mathbb{R^n} \to \mathbb{R^m}$, and we solve it with evolutionary algoritms (approximated algorithms, we do not know if $\exists \nabla F$ and we can not do the typical way for optimization problems). DNN and MOEAs could be merged if I consider it appropriate.

First of all, let $F:\Omega \subset \mathbb{R^n} \to \mathbb{R^m}$ a vectorial field, and $g(x)=(g(x_1),...,g(x_k))<=0 \text{ } \forall x \in \mathbb{R^n}$, i.e., $g(x_i)<=0 \text{ } \forall i \in \{1,...,k\}$.

We define Pareto dominance as it follows: let $u,v \in \mathbb{R^m}$ solutions, $u=(u_1,...,u_m),v=(v_1,...,v_m)$, We say that $u$ dominates $v$ if $\forall i \in \{1,\ldots,k\}$ $u_i$ is better or equal than $v_i$ and $\exists j \in \{1,\ldots,k\}$ with which $u_j$ is better than $v_j$.

Lastly, we say $x$ is an optimal Pareto in a domain $\Omega \subset \mathbb{R^n}$ if $F(x)$ dominates $F(y) \text{ } \forall y \in \Omega$

