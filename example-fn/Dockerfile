FROM alvaroRodriguezGallardo/alpine-python-opencv:v1
#FROM example-fn

# --- Customisation ----
  
ENV FSOURCE="./"
WORKDIR /example-fn
COPY . /example-fn
CMD python exercise_fn.py ${FSOURCE}

