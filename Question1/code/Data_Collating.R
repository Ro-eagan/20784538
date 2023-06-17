# Code function for loading in the data:

Collate_Data <- function(fileroot){

    library(tidyverse)

    # let's create a silent read function first (as it prints a load of nonsense if you use read_csv directly):
    silentread <- function(x){
        hushread <- purrr::quietly(read_csv)
        df <- hushread(x)
        df$result
    }

    datacolat <-
        list.files(fileroot, full.names = T, recursive = T) %>%
        as.list() %>%
        map(~silentread(.)) %>% bind_rows()
    # equivalent to using map_df

    datcolat

}