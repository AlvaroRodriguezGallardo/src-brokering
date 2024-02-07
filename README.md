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

Generally this repo is the same as ``main``, but in ``code`` folder it has been developed all necessary to generalise script for $M$ nodes, $P$ decision variables and nodes connected (maybe in a fully connected graph, but it has been implemented supposing it does not happen). Within ``code`` there is only a folder, ``workflow ideas``.

- [/code/workflow ideas](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/Multinode-System/code/workflow%20ideas): You will finde four folders: ``Platypus``, ``copia_seguridad``, ``docs(multiple node)`` and ``docs(one node)``.

- [/code/workflow ideas/Platypus](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/Multinode-System/code/workflow%20ideas/Platypus): Environment where script that uses Platypus can be executed. In ``moea_problem_broker.py`` you can find the code developed for a generalised graph with $M$ nodes and $P$ decision variables (SRCNet, it has been made because I do not know how many decision variables are needed and how many nodes are within SRCNet). In ``pruebas`` there are scripts developed for some features introduced within ``moea_problem_broker.py`` and in ``tests`` there are some test files with system features (JSON files) and/or functions can be executed within the system (it is thought system should be dynamic, but it has not been tested yet).

- [/code/workflow ideas/copia_seguridad](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/Multinode-System/code/workflow%20ideas/copia_seguridad): Here there are some files that could be useful in the future.

- [/docs/workflow ideas/docs(one node)](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/Multinode-System/code/workflow%20ideas/docs%20(one%20node)): Documentation of a system with a single node. It is a particular case of SRCNet.

- [/docs/workflow ideas/docs(multiple node)](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/Multinode-System/code/workflow%20ideas/docs%20(multiple%20node)): Documentation about SRCNet with a number of nodes not given.
