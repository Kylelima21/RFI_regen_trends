library(tidyverse)


make_plots <- function(parkcode) {
  
results_final <- read.csv("./results/20220325/final_park_results.csv") %>% 
  filter(metgrp == "Regen. Status") %>% 
  filter(park == paste(parkcode))

results_plot <- 
  ggplot(results_final, aes(x = park_ord, y = factor(label_order, level = c("Sapling Density", 
                                                                            "Seedling Density",
                                                                            "% Stocked Plots",
                                                                            "Stocking Index",
                                                                            "Deer Browse Impacts",
                                                                            "Flat Tree Diam. Dist.",
                                                                            "Sapling Composition",
                                                                            "Seedling Composition",
                                                                            "Sorensen Sapling",
                                                                            "Sorensen Seedling"))))+
  geom_tile(aes(fill = sign), color = 'gray15')+
  geom_text(aes(label = case_when(sign == "critical" ~ "●",
                                  sign == "caution" ~ "○",
                                  TRUE ~ "")))+
  #facet_grid(metgrp ~ park_reggrp, scales = 'free', space = 'free', switch = "y")+
  scale_fill_manual(values = c('critical' = "#FF5B5B", 
                               'caution' = "#FFFF79",
                               'acceptable' = '#BDEBA7'),
                               # "signdec_bad" = "#CD5C5C", 
                               # "signinc_good" = "#7DD66D", #"#228B22",
                               # "signdec_good" = "#6DA6D6", 
                               # "signinc_bad" = "#FF8C00",
                               # "nonsign" = "#E3E3E3", 
                               # "notmod" = "white"),
                    labels = c("●  Critical",
                               "○  Caution",
                               "    Acceptable"),
                               # " -         Sign. Decline (Native)",
                               # "+          Sign. Increase (Native)",
                               # " -         Sign. Decline (Exotic)",
                               # "+          Sign. Increase (Exotic)",
                               # "Not Significant",
                               # "Not Modeled"),
                    name = NULL)+
  scale_x_discrete(expand = c(0,0))+
  scale_y_discrete(limits = rev, expand = c(0,0))+
  theme_bw()+
  theme(axis.text.x = element_blank(),
        axis.ticks.x = element_blank(),
        axis.text.y = element_text(size = 13, color = "black"),
        axis.title = element_blank(),
        panel.border = element_rect(color = "black", size = 1),
        #strip.text.y = element_text(size = 10),
        #strip.text.x = element_text(size = 9.5),
        #strip.placement = 'outside',
        legend.spacing.x = unit(0.5, 'cm'),
        legend.position = 'right',
        legend.title = element_text(size = 10), 
        legend.text = element_text(size = 13, margin = margin(l = -0.9, unit = 'cm')),
        #legend.background = element_rect(color = "#B9B9B9", size = 0.25))+
        legend.background = element_blank())+
  labs(x = NULL, y = NULL)
  #guides(fill = guide_legend(ncol = 4, byrow = T, hjust = 1))

results_plot

#ggsave(paste("results/parkregen_plots/", "test.png"), height = 6, width = 4)
ggsave(paste("parkregen_plots/", parkcode, ".png"), height = 6, width = 4)

}
