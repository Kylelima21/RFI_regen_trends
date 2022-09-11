library(purrr)
library(tidyverse)

#' Function to create briefs for all 39 eastern national parks of interest.
#'
#' @param x: a data frame containing the park codes and full park names
#' @seealso None
#' @export 
#' @examples Not yet implemented

run_briefs <- function(x) {
  
  park_code <- x$park
  
  park_name <- x$park_full
  
  make_briefs <- function(park_code, park_name) {
    rmarkdown::render(input = "briefs/brief_params.Rmd", 
                      output_file = sprintf("outputs/%s_forest_brief.pdf", park_code),
                      params = list(park = park_name))
  }
  
  map2(park_code, park_name, make_briefs)
}