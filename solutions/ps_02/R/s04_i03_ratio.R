    source("../R/s02_i03_reg.R")
    
    # Step 2.b: Obtain the estimated ratio from the OLS estimates for each
    # bootstrap estimate
    ratio <- sapply(y_star_list,
                    function(y_star) {
                      (solve(t(X)%*%X)%*%t(X)%*%y_star)[2]/
                        (solve(t(X)%*%X)%*%t(X)%*%y_star)[4]
                    }
    )
    
    # Step 3: take the bootstrap estimate of the ratio
    ci_ratio_boot <- c(quantile(ratio,.025),quantile(ratio,.975))