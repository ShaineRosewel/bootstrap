    source("../R/s01_i02_alpha_quantile.R")
    
    robust_se <- function(quantile_vector, alpha) {
      return(
        (
          quantile_vector[
            names(quantile_vector) == paste0(as.character(alpha*100),"%")
            ] - 
          quantile_vector[
            names(quantile_vector) == paste0(as.character((1-alpha)*100),"%")
            ]
        )/2*qnorm(alpha)
      )
    } 
    
    robust_se_r <- sapply(c(0.95, 0.90, 0.85), 
                          function(x){robust_se(quant, alpha = x)})