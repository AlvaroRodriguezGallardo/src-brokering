![imagen](https://github.com/AlvaroRodriguezGallardo/src-brokering/assets/7033451/24942575-d479-41c6-b918-7a21b2cc76f1)

# SRC Brokering

SRC brokering for JAE Intro Scholarship

## How to run a function with Docker
### Note: This is a general ReadMe.md. You should use one of the folders. Name a folder <folder_version>. In each folder, there is an example with that folder name. This is a generalitation.
Some functions

I have used Docker Desktop aplication. The steps for a succesful execution are:

```
docker build -t image1-fn <folder_version>
```

In this step, we create an image called `image1-fn` with a created dockerfile, and we specify the directory in wich we have the programme and the dockerfile.

```
docker run --name contenedor2-fn -v $(pwd)/<folder_version>/images:/<folder_version>/images -e FSOURCE='images' image1-fn
```

We create a conainer called `contenedor2-fn`, and path for mounting the `images` directory is specified. Consequently, result will be in that directory. We write the image we want in te container too.


Finally, we have executed the programme, which gets the image `perro_husky.jpg` in `images`, gets the face borders and save the result in `images`.


*This is a simple version of the program. If you want more complexity, please use one of the next links:*.

[example-fn-logging](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/logging-output): With this version, you could see hot the program runs with 'docker logs <image>'.

[example-fn-optimised](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/example-fn-optimised): In this version, Dockerfile use a low weight image


## Work

In this branch, you will find documentation and code about a system with only a node. If you want to see documentation and code about a general algorithm based in MOEA, please, go to branch [Multinode-System](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/Multinode-System). Documentation about WSClean and a bit of DNNs are here too.

Now it will be explained every folder in this branch.

- [/docs](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/main/docs): Here you will find three folders: ``OSCAR``, ``broker`` and ``wsclean``.
- 
- [/docs/OSCAR](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/main/docs/OSCAR): There is a Readme.md where you can read all about OSCAR instalation: what is OSCAR, ways to install it,...
- 
- [/docs/wsclean](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/main/docs/wsclean): There is a Readme.md where it is summarized WSClean library from the point of view of a mathematical and/or computer scientist. All about arguments that could be interesting, what is WSClean,...
- 
- [/docs/broker](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/main/docs/broker): Broker is a set of algorithms that leads all about system control. You will find two folders: ``DNN/Transformer`` and ``MOEA``.
- 
- [/docs/broker/DNN/Transformer](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/main/docs/broker/DNN/Transformer): Information about transformers for an interpretation problem. It is not very developed.
- 
- [/docs/broker/MOEA](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/main/docs/broker/MOEA): All developed about MOEA algorithms for broker is here, and a script that interpolates functions because it was thought to be necessary. You will find two folders. In ``Platypus`` folder there are only examples made for training. In ``Workflow ideas`` folder you will find ideas about algorithm.
- 
- [/docs/broker/MOEA/Workflow ideas](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/main/docs/broker/MOEA/Workflow%20ideas): Ideas explained in detail about theorical behaviour. ``Platypus`` folder has the environment and script that simulates the algorithm.
- 
- [/docs/broker/MOEA/Workflow ideas/Platypus](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/main/docs/broker/MOEA/Workflow%20ideas/Platypus): Environment with docs you need to use Platypus library. Within file ``moea_problem_broker.py`` you can find the simulation of the algorithm and how model has been implemented.

