library(purrr)

park_names <- read.csv("./data/park_names.csv")

test <- c("ACAD", "GETT")

make_briefs <- function(x) {
  rmarkdown::render(input = "briefs/brief_params.Rmd", 
                    output_file = sprintf("outputs/%s_forest_brief.pdf", x),
                    params = list(park = x))
}

map(test, make_briefs)
