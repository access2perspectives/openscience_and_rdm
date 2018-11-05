library (dplyr)
library (ggplot2)

#read data
concatenated <- read.csv("~/github_repo/teach_OS_RDM/non_website/data/vornamen_bochum/concatenated.csv", header=TRUE)

#filter data for best name of 2017
best2017 = concatenated %>% filter (year == "2010", rang == "1")

# get data of all year for these names
# women
plotdataw = concatenated %>% 
  filter (women == best2017$women)%>% 
  mutate (sex = best2017$women)
#men
plotdatam = concatenated %>%
  filter (male == best2017$male)%>% 
  mutate (sex = best2017$male)

# put data togther
plotdatan = rbind (plotdataw,plotdatam)
#plot the data
plotdatan %>% 
  ggplot() + geom_line(aes(y = -rang, x = year, linetype = sex),
                      stat="identity")
