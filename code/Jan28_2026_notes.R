# Notes from R lesson on Jan 26, 2026
## Goals: to learn how to plot in R with ggplot2

# load Packages 
library(tidyverse)

# load data 
sample_data = read_csv("sample_data.csv")

# No inputs/arguments needed 
getwd()
Sys.Date()

# other functions require input 
sum(3, 5)
sum((3*5)^2)
?round
round(3.1415) 
round(3.1415,3)

# Plot 
?ggplot
ggplot(data = sample_data) + 
  aes(x = temperature, y = cells_per_ml, 
      col = env_group, size = chlorophyll) + 
  labs(x= "Temperature (C°)",
       y = "Cells per mL", 
       title = "Does temperature affect microbial abundance?", 
       color = "Environmental Group", 
       size = "Cjlorophyll (ug/L)") +
  geom_point()

# load in new data 
buoy_data = read_csv("buoy_data.csv")
dim(buoy_data)  
head(buoy_data)

#plot day of year on x axis and temp on y
ggplot(data = buoy_data) + 
  aes(x = day_of_year, y=temperature, 
      color = depth, group = sensor) + 
  geom_line() + 
  facet_wrap(~buoy)

#What is the structure of the data? 
str(buoy_data)

#go back to sample_data
ggplot(data = sample_data) + 
  # x-axis that is discrete: categorical 
  aes(x= env_group, y = cells_per_ml,
      #color = env_group, 
      fill = env_group) + 
  geom_jitter(aes(size = chlorophyll), 
              shape = 23, 
              alpha = 0.6) +
  geom_boxplot(alpha = 0.2, outliers = F) + 
  #scale_color_manual(values = c("cornflowerblue", "seagreen", "darkgreen"))
  #scale_color_brewer(palette = "Set2") + 
  scale_fill_brewer(palette = "Set2")

# Univariate Plots

ggplot(sample_data) + 
  aes(x = cells_per_ml,) + 
  geom_histogram(bins = 20) + 
  theme_linedraw() #?theme_bw

# saving plots 
ggsave("histogram_cellsPermL.png", 
       width = 6, height = 4, 
       units = "in")

# Whats the relationship between chlorophyll and temperature? 
ggplot(sample_data) + 
  aes(x = temperature, y = chlorophyll) + 
  labs(y = "Chlorophyll ug/L", x = "Temp. C°", 
       title = "Cholorophyll levels In Different Temperatures of Lake Ontario") +
  geom_smooth() + 
  geom_point(aes(color = env_group)) + 
  scale_color_manual(values = c("cornflowerblue", "maroon", "darkgreen"))


                     