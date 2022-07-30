# Script to run the function that creates the parameterized briefs
# Kyle Lima - Schoodic Institute at Acadia National Park


# Source function
source("./briefs/scripts/run_briefs_function.R")


# Read in data
park_names <- read.csv("./data/park_names.csv") %>% 
  filter(park == "ACAD" | park == "GETT")


# Create briefs
run_briefs(park_names)

