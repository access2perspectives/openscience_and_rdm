#----- read data and merge them in one file
library(tidyr)
## list files

setwd("~/github_repo/teach_OS_RDM/non_website/data/vornamen_bochum")
files <- list.files ()

## read data AND MERGE
datacom = c()
for (i in seq_along(files)){

  data1 <- read_csv(files [i],
col_names = FALSE)[c(1:31),]

  
  #data1 = data1[data1$V2 !="",]
  
  data1$year = files [i]
  datacom = rbind (datacom, data1)
}

datacom$year <- substr(datacom$year, 9, 12)
names (datacom) =  c("rang", "women", "number", "male", "number", "year")
  
write.csv (datacom, file = "concatenated.csv")
