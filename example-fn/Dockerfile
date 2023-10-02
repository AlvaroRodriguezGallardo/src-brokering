#Dockerfile

FROM python:3.8

# Copia los archivos de trabajo al contenedor
COPY exercise_fn.py /app-fn/
COPY images/perro_husky.jpg /app-fn/images/

# Establece el directorio de trabajo
WORKDIR /app-fn

# Instala las dependencias de Python (en este caso, OpenCV y NumPy)
RUN pip install opencv-python-headless numpy

# Ejecuta el script de Python
CMD ["python", "exercise_fn.py"]
