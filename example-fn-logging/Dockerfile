#Dockerfile. Ejecutar en la carpeta donde esté todo lo que quiero copiar a /example-fn de docker

FROM python:3.8

ENV FSOURCE="./"

WORKDIR /example-fn-logging

COPY . /example-fn-logging

RUN apt-get update && apt-get install -y libgl1-mesa-glx
RUN pip install -r requirements.txt

CMD python exercise_fn.py ${FSOURCE}
