
# Example function

This function takes an image and it extracts the edges.

- It uses [OpenCV](https://opencv.org/) libraries and numpy (see [requirements.txt](requirements.txt)).

![imagen](https://github.com/AlvaroRodriguezGallardo/src-brokering/assets/7033451/c5f6d00c-553c-4182-a5b9-667033078a7f)


## How to run this function

The steps for a succesful execution are (two ways):

If you are within this folder:

```
docker build . -t image1-fn
```

If you are on top of the this folder (one level before):

```
docker build -t image1-fn example-fn-optimised
```

In this step, we create an image called `image1-fn` with a created dockerfile, and we specify the directory in wich we have the programme and the dockerfile. You must give an argument (image or folder)

```
docker run --name contenedor2-fn -v $(pwd)/example-fn-optimised/images:/example-fn-optimised/images -e FSOURCE='images' image1-fn
```

However, if you are in the folder `example-fn-optimised`, you should run 

```
docker run --name contenedor2-fn -v $(pwd)/images:/example-fn-optimised/images -e FSOURCE='images' image1-fn
```

We create a conainer called `contenedor2-fn`, and path for mounting the `images` directory is specified. Consequently, result will be in that directory. We write the image we want in te container too. In this example, I specify as argument the folder `images`. Remember that the program needs a path since the folder `example-fn-optimised`

We create a conainer called `contenedor2-fn`, and path for mounting the `images` directory is specified. Consequently, result will be in that directory. We write the image we want in te container too. In this example, I specify as argument the folder `images`. Execution is done in `example-fn-optimised`, so it does not appear in path.


Finally, we have executed the programme, which gets edges of the image (or the images in the folder) and save it in the path specificated.

If you want to look which operations are done, after running the container, run

```
docker logs contenedor2-fn
```
