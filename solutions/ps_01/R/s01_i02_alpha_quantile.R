    source("../R/s02_i01_bs_sampling.R")
    
    quant <- quantile(r,
                      probs = c(0.05, 0.10, 0.15, 0.20, 0.50, 
                                0.70, 0.85, 0.90, 0.95), 
                      names = TRUE)