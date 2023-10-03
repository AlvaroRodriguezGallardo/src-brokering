# src-brokering
src-brokering for JAE Intro Scholarship

## Operative system: Ubuntu 20.04

I have used Docker Desktop aplication. The steps for a succesful execution of the container are:

- docker build -t image1-fn example-fn

In this step, we create an image called 'image1-fn' with a created dockerfile, and we specify the directory in wich we have the programme and the dockerfile.

- docker run --name contenedor2-fn -v $(pwd)/example-fn/images:/images image1-fn

We create a conainer called 'contenedor2-fn', and path for mounting the 'images' directory is specified. Consequently, result will be in that directory. We write the image we want in te container too.


Finally, we have executed the programme, which gets the image 'perro_husky.jpg' in 'images', gets the face borders and save the result in 'images'.
