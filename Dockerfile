FROM dclong/ubuntu_b

RUN apt-get update \
    && apt-get -y install \
        unzip bzip2 \
    && curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /scripts/miniconda.sh \
    && bash /scripts/miniconda.sh -bfp /opt/conda \
    && rm -rf /scripts/miniconda.sh \
    && conda install -y python=3 \
    && conda update conda \
    && apt-get autoremove \
    && apt-get autoclean \
    && conda clean --all --yes

ENV PATH /opt/conda/bin:$PATH
