# Studying about the broker

In this document, I will expose information a get about the broker which can be used in our distributed system. I will discuss what is the aim, and then I will write abou possible algorithms can be implmented. As our problem is a classification problem, I will research about machine learning algorithms, and libraries that can be used (in Python).

## Main aim

Supposed our system has been developed succesfully, we can have the next question: 'I have to use a flag to distinct cases, but I do not know nothing about the internal exection. How do I know if the chosen option is the best one?'. Because of this question, we have to develop a 'broker', which is a module of our system which knows about all system, internal executions, properties of the rest of modules,... This broker receives an order, and divides the problem in two parts:

- What does the user want to?---> Broker needs to interpret the comand or order given.
- Where should I execute this order if I want to optimise execution?--->Thanks to the last part, broker knows what the user wants, so how it knows about all system, as it was specificated before, it must face to a classification problem, and **decide** which is te best option in the way of optimising resources,time,... (optimitation problem with an scalar field $f:\Omega\subset\mathbb{R^n} \to \mathbb{R}$ ?

A wide range of algorithms can be used, but I will try to specificate the most interestings ones, depending in which problem I am:

### 1- What does the user want to?

### 2- Where should I execute this order if I want to optimise execution?
