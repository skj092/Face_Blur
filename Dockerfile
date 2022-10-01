# loading ubuntu 22.04 
FROM ubuntu:22.04

# installing python3 and pip3
RUN apt-get update && apt-get install -y python3 python3-pip wget 

# installing miniconda 
RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \ 
    && sh Miniconda3-latest-Linux-x86_64.sh -b -p /root/.conda \
    && rm Miniconda3-latest-Linux-x86_64.sh
    

# setting up the path
ENV PATH="/root/.conda/bin:${PATH}"

# update the conda
RUN conda update -n base -c defaults conda

# set the working directory to the project directory
WORKDIR /project

# copy the project files to the project directory
COPY . /project

# creating a conda environment and installing the dependencies
RUN conda create -n myenv 


RUN /bin/bash -c "source activate myenv && pip install -r requirements.txt"

# setting the entry point
ENTRYPOINT ["/bin/bash", "-c", "source activate myenv && python3 blur_face_img.py"]

