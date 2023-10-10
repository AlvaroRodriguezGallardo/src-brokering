![imagen](https://github.com/AlvaroRodriguezGallardo/src-brokering/assets/7033451/24942575-d479-41c6-b918-7a21b2cc76f1)

# SRC Brokering

SRC brokering for JAE Intro Scholarship

## How to run a function with Docker

I have used Docker Desktop aplication. The steps for a succesful execution are:

```
docker build -t image1-fn example-fn
```

In this step, we create an image called `image1-fn` with a created dockerfile, and we specify the directory in wich we have the programme and the dockerfile.

```
docker run --name contenedor2-fn -v $(pwd)/example-fn/images:/example-fn/images -e FSOURCE='images' image1-fn
```

We create a conainer called `contenedor2-fn`, and path for mounting the `images` directory is specified. Consequently, result will be in that directory. We write the image we want in te container too.


Finally, we have executed the programme, which gets the image `perro_husky.jpg` in `images`, gets the face borders and save the result in `images`.


*This is a simple version of the program. If you want more complexity, please use one of the next links:*
example-fn-logging[example-fn-logging](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/logging-output): With this version, you could see hot the program runs with 'docker logs <image>'.

example-fn-optimised[example-fn-optimised](https://github.com/AlvaroRodriguezGallardo/src-brokering/tree/example-fn-optimised): In this version, Dockerfile use a low weight image
