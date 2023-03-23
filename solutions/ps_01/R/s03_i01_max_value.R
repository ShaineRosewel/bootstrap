    source("../R/s02_i01_bs_sampling.R")
    
    r_max <- max(r)
    
    r_replaced <- replace(r, r==r_max, 100*r_max)
    r_replaced_max <- max(r_replaced)
    se_r_replaced_boot <- sd(r_replaced)
    
    se_percent_change <- ((se_r_replaced_boot - se_r_boot)/se_r_boot)*100