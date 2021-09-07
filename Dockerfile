FROM dclong/ubuntu_b

ENV PATH=/opt/conda/bin:$PATH

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        gcc \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
        
RUN curl -sSL https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /scripts/miniconda.sh \
    && bash /scripts/miniconda.sh -bfp /opt/conda \
    && rm -rf /scripts/miniconda.sh \
    && conda update -n base conda \
    && conda install -y python=3 \
    && conda install -c conda-forge conda-pack \
    && conda init bash \
    && pip install git+https://github.com/dclong/xinstall \
    && xinstall svim -ic --no-lsp \
    && conda install -c conda-forge python-language-server[all] \
    && conda clean --all --yes \
    && pip cache purge


RUN echo 'export PATH=/opt/conda/bin:$PATH' >> /etc/profile
WORKDIR /workdir
