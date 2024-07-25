# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ucsdets/rstudio-notebook:2023.2-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

COPY run_jupyter.sh /
RUN chmod +x /run_jupyter.sh

RUN mamba install -c conda-forge r-neuralnet 


USER jovyan

# RUN conda install -y scikit-learn -c conda-forge

# RUN pip install --no-cache-dir networkx scipy

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
