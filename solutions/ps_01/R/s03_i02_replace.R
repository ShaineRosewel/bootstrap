    source("../R/s03_i01_max_value.R")
    source("../R/s02_i02_se.R")
    
    quant_replaced <- quantile(r_replaced,
                               probs = c(0.05, 0.10, 0.15, 0.20, 0.50, 
                                         0.70, 0.85, 0.90, 0.95), 
                               names = TRUE)
    
    robust_se_r_replaced <- sapply(c(0.95, 0.90, 0.85), 
                                   function(x){robust_se(quant_replaced, 
                                                         alpha = x)})