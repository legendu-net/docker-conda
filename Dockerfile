FROM dclong/ubuntu_b

RUN curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /scripts/miniconda.sh \
    && bash /scripts/miniconda.sh -bfp /opt/conda \
    && rm -rf /scripts/miniconda.sh \
    && conda update -n base conda \
    && conda install -y python=3 \
    && conda clean --all --yes
