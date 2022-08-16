FROM cmccornack/signacplus:v2

RUN apt-get install -y libgeos-dev

# Seurat
Run R -e "BiocManager::install('Seurat')" 

#scWGCNA
Run R -e "BiocManager::install('preprocessCore', version = '3.14')" 
Run R -e "BiocManager::install('impute', version = '3.14')" 
RUN R -e "remotes::install_github('cferegrino/scWGCNA', ref='main')" 

# JASPAR2020
Run R -e "remotes::install_github('da-bar/JASPAR2020')"

#SeuratWrappers, monocle3, and rcartocolor
Run R -e "BiocManager::install('SeuratWrappers', version = '3.14')" 
Run R -e "BiocManager::install('monocle3', version = '3.14')" 
RUN R -e "remotes::install_github('Nowosad/rcartocolor')"