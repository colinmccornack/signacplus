FROM cmccornack/signacplus:v2.1

RUN apt-get install -y libgeos-dev

RUN pip install -U pip    
RUN pip install -U macs2

# Seurat and SeuratWrappers
Run R -e "BiocManager::install('Seurat')" 
Run R -e "remotes::install_github('satijalab/seurat-wrappers')"

#scWGCNA
Run R -e "BiocManager::install('preprocessCore', version = '3.14')" 
Run R -e "BiocManager::install('impute', version = '3.14')" 
RUN R -e "remotes::install_github('cferegrino/scWGCNA', ref='main')" 

# JASPAR2020 & rcartocolor
Run R -e "remotes::install_github('da-bar/JASPAR2020')"
RUN R -e "remotes::install_github('Nowosad/rcartocolor')"

# Note: I would like to install monocle3 but am having trouble with the Cairo install

# scImpute, singleCellHaystack, scCATCH
RUN R -e "remotes::install_github(c('Vivianstats/scImpute', 'alexisvdb/singleCellHaystack', 'ZJUFanLab/scCATCH'))" \
# velocyto.R
    && R -e "remotes::install_github(c('aertslab/SCopeLoomR', 'velocyto-team/velocyto.R'))" \
    && R -e "install.packages('pagoda2')"

RUN R -e "BiocManager::install(c('batchelor', 'Matrix.utils'))" 