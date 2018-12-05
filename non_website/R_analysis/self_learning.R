# data was downloaded from figshare, doi:https://doi.org/10.5061/dryad.8v7f3br5
library (dplyr)
library (ggplot2)
# read the data in R
library(readr)
selflearning <- read_delim("non_website/data/selflearning.txt",
";", escape_double = FALSE, trim_ws = TRUE)
View(selflearning)

# verify group is a factor and PI2 and 8 are numbers
selflearning$group

# filter data on Canton_s and FoxP_3955 only data
selflearning_mutant = selflearning %>% filter (group == "Canton_s" | group =="FoxP_3955")

# filter data on abosulute value of PI2 is superior to 0.66
selflearning_mutant = selflearning_mutant %>% filter (abs (PI2)<0.66)
# barplot, copied from https://www.r-graph-gallery.com/4-barplot-with-error-bar/


# Data
# data <- iris %>% select(Species, Sepal.Length) 
# 
# # Calculates mean, sd, se and IC
# my_sum <- data %>%
#   group_by(Species) %>%
#   summarise( 
#     n=n(),
#     mean=mean(Sepal.Length),
#     sd=sd(Sepal.Length)
#   ) %>%
#   mutate( se=sd/sqrt(n))  %>%
#   mutate( ic=se * qt((1-0.05)/2 + .5, n-1))
# 
# # Standard deviation
# ggplot(my_sum) +
#   geom_bar( aes(x=Species, y=mean), stat="identity", fill="forestgreen", alpha=0.5) +
#   geom_errorbar( aes(x=Species, ymin=mean-sd, ymax=mean+sd), width=0.4, colour="orange", alpha=0.9, size=1.5) +
#   ggtitle("using standard deviation")
# 
# # Standard Error
# ggplot(my_sum) +
#   geom_bar( aes(x=Species, y=mean), stat="identity", fill="forestgreen", alpha=0.5) +
#   geom_errorbar( aes(x=Species, ymin=mean-se, ymax=mean+se), width=0.4, colour="orange", alpha=0.9, size=1.5) +
#   ggtitle("using standard error")
# 
# # Confidence Interval
# ggplot(my_sum) +
#   geom_bar( aes(x=Species, y=mean), stat="identity", fill="forestgreen", alpha=0.5) +
#   geom_errorbar( aes(x=Species, ymin=mean-ic, ymax=mean+ic), width=0.4, colour="orange", alpha=0.9, size=1.5) +
#   ggtitle("using confidence interval")

my_sum <- selflearning_mutant %>%
  group_by(group) %>%
  summarise(
    n=n(),
    mean=mean(PI8),
    sd=sd(PI8)
  ) %>%
  mutate( se=sd/sqrt(n))  %>%
  mutate( ic=se * qt((1-0.05)/2 + .5, n-1))

ggplot(my_sum) +
  geom_bar( aes(x=group, y=mean), stat="identity", fill="forestgreen", alpha=0.5) +
  geom_errorbar( aes(x=group, ymin=mean-se, ymax=mean+se), width=0.4, colour="orange", alpha=0.9, size=1.5) +
  ggtitle("using standard error")+
  geom_text(aes (x=group, y=0.05, label =n))

wilcox.test (PI8 ~group,data =selflearning_mutant)
