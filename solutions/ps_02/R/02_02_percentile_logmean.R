    B <- 2000
    
    plug_in_estimator <- function(A,B, est = "theta_1"){
      if (est == "theta_1") {
        return(log(mean(A/B)))
      } else if (est == "theta_2") {
        return(mean(log(A/B)))
      }
    }
    
    theta_1_hat_star <- c()
    theta_2_hat_star <- c()
    set.seed(7)
    for (b in 1:B) {
      bs_sample <- spatial_test_data[sample(spatial_test_data[,1], 
                                            n1, 
                                            replace = TRUE),] 
      theta_1_hat_star[b] <- plug_in_estimator(bs_sample$A,
                                               bs_sample$B, 
                                               est = "theta_1")
      theta_2_hat_star[b] <- plug_in_estimator(bs_sample$A,
                                               bs_sample$B, 
                                               est = "theta_2")
    }
    
    theta_1_pci <- c(quantile(theta_1_hat_star,.025),
                     quantile(theta_1_hat_star,.975))
    #theta_1_pci