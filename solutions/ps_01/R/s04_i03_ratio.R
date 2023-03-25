    source("../R/s02_i03_reg.R")
    
    ratio <- sapply(y_star_list,
                    function(y_star) {
                      (solve(t(X)%*%X)%*%t(X)%*%y_star)[2]/
                        (solve(t(X)%*%X)%*%t(X)%*%y_star)[4]
                    }
    )
    
    ci_ratio_boot <- c(quantile(ratio,.025),quantile(ratio,.975))