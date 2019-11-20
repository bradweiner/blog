##This file cleans up the IPEDS data so it is interpretable and useful#

#TRY THIS##

# df <- get_education_data(level = "college-university",source = "ipeds",topic = "directory",add_labels = T,filters = list(year=2016))

#load libraries

library(tidyverse)
library(magrittr)
library(janitor)
library(dataMeta)
library(here)

#read in data files from IPEDS#

# d <- read.csv("data/Data_10-11-2019---735.csv",stringsAsFactors = F)
# d %<>% select(.,1:12)

d <- read.csv(here("content/post/the-modal-institution-of-higher-education/data/","data_table.csv"),stringsAsFactors = F)

e <- read.csv(here("content/post/the-modal-institution-of-higher-education/data/","data_dict.csv"),stringsAsFactors = F)

#clean column names

d <- clean_names(d,case = "snake")
d$x <- NULL

e <- clean_names(e,case = "snake")
head(e)

#create data file to preserve original IPEDS pull

data_pull_names <- names(d)
data_pull_names
write.csv(data_pull_names,"data/original_ipeds_var_names.csv",row.names = F)

#create data dictionary for display

linker <- prompt_linker(d)

#write data dictionary

write.csv(linker,"data/data_dict.csv",row.names = F)

#remove weirdness from column names

names(d)

#pattern _[^_]+$ is 'everything after the underscore'

names(d) <- gsub("_[^_]+$","",names(d))

#match those names in the description file

names(e)
table(e$variable_name)

e$variable_name %<>% tolower(.)
e$variable_name <- gsub("hd2018",replacement = "", e$variable_name)
e$variable_name <- gsub("\\(",replacement = "", e$variable_name)
e$variable_name <- gsub("\\)",replacement = "", e$variable_name)
e$variable_name <- gsub(" ",replacement = "", e$variable_name)

unique(e$variable_name) %in% names(d)

#Append dictionary files to the normalized data


head(e)
names(e)
names(d)

# monkey <- gather(e,key = value,value = value,value_label)

e <- spread(e,key = variable_name,value = value_label)
head(e)


e <- e %>%
        mutate_if(is.integer,as.character) 

d <- d %>%
        mutate_if(is.integer,as.character) 

varnames <- names(e)
varnamestest <- varnames[2:length(varnames)]

for(i in varnamestest){
        
        temp_dict <- e %>%
                select(i,value) %>%
                na.omit() %>%
                rename(.,newval = value)
        
        names(temp_dict) <- c(paste0(i,"_val"),i)
        
        join_df <- left_join(d,temp_dict)
        
        d <- join_df
        
       
}

#OTHER CLEANUP



##ANALYSIS OF THE MODAL INSTITUTION##

d.agg <- d %>%
        count(c18basic_val,
              control_val,
              deggrant_val,
              iclevel_val,
              instcat_val,
              instsize_val,
              obereg_val,
              opeflag_val,
              sector_val,
              sort = TRUE) %>%
        
head(d.agg)     
        
        
