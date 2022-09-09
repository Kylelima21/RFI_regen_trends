# Script to run the function that creates the parameterized briefs
# Kyle Lima - Schoodic Institute at Acadia National Park

# Source function
source("./briefs/scripts/run_briefs_function.R")

# Read in data
# park_data <- read.csv("./results/20220325/final_park_results.csv") %>% 
#   select(park, park_reggrp) %>% 
#   distinct() %>% 
#   mutate(park_reggrp = str_replace(park_reggrp, "Sec.", "Secure"))

park_names <- read.csv("./data/park_names.csv") %>% 
  #left_join(., park_data, by = "park") %>% 
  filter(park == "ACAD" | park == "CATO" 
         | park == "MORR" | park == "HAFE")

park_names <- read.csv("./data/park_names.csv") #%>% 
  #filter(park != "FRSP")
  #left_join(., park_data, by = "park") %>% 
  #filter(park == "FRSP")

# Create briefs
run_briefs(park_names)


