FROM timoast/signac

# tidyverse, doubletFinder, and other utils
RUN R -e "remotes::install_github('chris-mcginnis-ucsf/DoubletFinder')" \
    && R -e "options(timeout=6000); BiocManager::install('BSgenome.Hsapiens.UCSC.hg38')" \
    && R -e "BiocManager::install(c('EnsDb.Hsapiens.v75','EnsDb.Hsapiens.v79', 'EnsDb.Hsapiens.v86', 'EnsDb.Mmusculus.v79'))" \
# complexHeatmap
    && R -e "remotes::install_github(c('jokergoo/ComplexHeatmap'))" \
# SingleR
    && R -e "BiocManager::install(c('SingleR','scRNAseq','celldex'))" \

# clusterProfiler, scWGCNA and ArchR
RUN R -e "BiocManager::install('clusterProfiler')" \
    && R -e "remotes::install_github('cferegrino/scWGCNA', ref='main')" \
    && R -e "remotes::install_github('GreenleafLab/ArchR', ref='master', repos = BiocManager::repositories())" \
# Harmony
    && R -e "install.packages('gganimate')" \
    && R -e "BiocManager::install(c('sva','DESeq2'))" \
    && R -e "remotes::install_github(c('immunogenomics/harmony','immunogenomics/presto','JEFworks/MUDAN'))"