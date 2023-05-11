    # helper functions==========================================================
    
    bias_correction <- function(bootstrap_estimates, 
                                plug_in_estimate, 
                                B){
      return(qnorm(sum(bootstrap_estimates < plug_in_estimate)/B))
    }
    
    acceleration_parameter <- function(data = spatial_test_data, 
                                       est = "theta_1"){
      for (i in n1) {
        summ <- ((sum(
          plug_in_estimator(data$A[-i],
                            data$B[-i],
                            est = est))/n1) - plug_in_estimator(data$A[-i], 
                                                               data$B[-i], 
                                                               est = est))
        return(sum(summ^3) / (6*((sum(summ)^2))^(3/2)))
      }
    }
    
    alpha <- function(confid = 0.95, 
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
    
    BC_a <- function(confid = .95, 
                     est = "theta_1",
                     bootstrap_estimates = theta_1_hat_star,
                     plug_in_estimate = plug_in_estimate_theta_1
    ){
      return(c(quantile(bootstrap_estimates,
                        alpha(1-confid, est = est, 
                              plug_in_estimate = plug_in_estimate)),
               quantile(bootstrap_estimates,
                        alpha(confid, est = est, 
                              plug_in_estimate = plug_in_estimate))))
    }
    
    # BCa for logmean computation ==============================================
    
    plug_in_estimate_theta_1 <- plug_in_estimator(spatial_test_data$A, 
                                                  spatial_test_data$B, 
                                                  est = "theta_1")
    
    theta_1_BCa <- BC_a(confid = .95,
                        est = "theta_1",
                        bootstrap_estimates = theta_1_hat_star,
                        plug_in_estimate = plug_in_estimate_theta_1)
    
    #theta_1_BCa