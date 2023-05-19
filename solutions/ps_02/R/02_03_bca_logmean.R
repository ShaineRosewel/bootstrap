    # helper functions========================================================

    bias_correction <- function(bootstrap_estimates, 
                                plug_in_estimate, 
                                B){
      return(qnorm(sum(bootstrap_estimates < plug_in_estimate)/B))
    }
    
    acceleration_parameter <- function(data = spatial_test_data, 
                                       est = "theta_1"){
      
      th.jack <- sapply(1:n1, function(x){plug_in_estimator(data$A[-x],
                                                              data$B[-x],
                                                              est = est)})
      
      L <- mean(th.jack) - th.jack
      
      return( sum(L^3)/(6 * sum(L^2)^1.5) )
      }
    
    alpha <- function(confid = .975, 
                      est = "theta_1",
                      bootstrap_estimates = theta_1_hat_star,
                      plug_in_estimate = plug_in_estimate_theta_1){
      
      bc <- bias_correction(bootstrap_estimates = bootstrap_estimates,
                            plug_in_estimate = plug_in_estimate, 
                            B = B)

      ap <- acceleration_parameter(data = spatial_test_data, 
                                   est = est)

      return(pnorm(bc + (bc + qnorm(confid))/(1-(ap*(bc + qnorm(confid))))))
    }
    
    BC_a <- function(confid = .975, 
                     est = "theta_1",
                     bootstrap_estimates = theta_1_hat_star,
                     plug_in_estimate = plug_in_estimate_theta_1
    ){
      return(c(quantile(bootstrap_estimates,
                        alpha(1-confid, est = est, 
                              bootstrap_estimates = bootstrap_estimates,
                              plug_in_estimate = plug_in_estimate)),
               quantile(bootstrap_estimates,
                        alpha(confid, est = est, 
                              bootstrap_estimates = bootstrap_estimates,
                              plug_in_estimate = plug_in_estimate))))
    }
    
    # BCa for logmean computation ============================================
    
    plug_in_estimate_theta_1 <- plug_in_estimator(spatial_test_data$A, 
                                                  spatial_test_data$B, 
                                                  est = "theta_1")
    
    theta_1_BCa <- BC_a(confid = .975,
                        est = "theta_1",
                        bootstrap_estimates = theta_1_hat_star,
                        plug_in_estimate = plug_in_estimate_theta_1)
    
    theta_1_BCa
    #if bc & ap are 0: (-0.06867057, 0.16486927)
    