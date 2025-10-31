FROM quay.io/jupyter/datascience-notebook
USER root

ARG openjdk_version="17"
RUN apt-get update --yes && \
    apt-get install --yes --no-install-recommends \
    build-essential \
    ca-certificates-java \
    default-libmysqlclient-dev \
    "openjdk-${openjdk_version}-jre-headless" \
    pkg-config && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
COPY requirements.txt /home/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /home/requirements.txt && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER ${NB_UID}
