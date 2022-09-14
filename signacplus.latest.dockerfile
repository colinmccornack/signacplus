FROM cmccornack/signacplus:v2.3


RUN apt-get update \
  && apt-get install -y --no-install-recommends \ 
  cmake \ 
  libudunits2-dev \
  libgdal-dev \
  libgeos-dev \
  libproj-dev \
  libharfbuzz-dev \
  libfribidi-dev \ 
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN R -e "remotes::install_github('r-lib/ragg')"
RUN R -e "remotes::install_cran('nloptr')"

# Monocle3
RUN R -e "BiocManager::install(c('BiocGenerics', 'limma', 'S4Vectors', 'SingleCellExperiment', 'SummarizedExperiment', 'batchelor', 'Matrix.utils'))" \
    && R -e "remotes::install_github('r-spatial/sf', configure.args = '--with-proj-lib=/usr/local/lib/')" \
    && R -e "remotes::install_github('cole-trapnell-lab/leidenbase')" \
    && R -e "remotes::install_github('cole-trapnell-lab/monocle3', ref='develop')" \
    && R -e "BiocManager::install(c('org.Mm.eg.db', 'org.Hs.eg.db', 'org.Dm.eg.db', 'org.Ce.eg.db'))" \
    && R -e "remotes::install_github('cole-trapnell-lab/garnett', ref='monocle3')" \
# cicero
    && R -e "remotes::install_github('cole-trapnell-lab/cicero-release', ref = 'monocle3')"