FROM nvidia/cuda:11.4.1-runtime-ubuntu18.04

ARG PYTHON=python3.7
ARG REQUIREMENTS_FILE=requirements.txt


RUN apt-get update \
    && apt-get install --no-install-recommends -y \
        build-essential \
        software-properties-common \
    && add-apt-repository -y ppa:deadsnakes/ppa \
    && apt-get install --no-install-recommends -y \
        ${PYTHON} \
        python3-pip \
        python3-setuptools \
        python3-distutils \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /environment
COPY ${REQUIREMENTS_FILE} requirements.txt
RUN ${PYTHON} -m pip install --upgrade pip wheel \
    # && ${PYTHON} -m pip install jupyterlab jupyterlab-vim \
    && ${PYTHON} -m pip install -r ${REQUIREMENTS_FILE}

CMD echo "Give me some command"
