      plug_in_estimator <- function(data) return(mean(data))
      
      B <- 1000
      theta_hat_star <- c()
      set.seed(seed)
      
      for (b in 1:B) {
        bs_sample <- sample(log_data, n, replace = TRUE)
        theta_hat_star[b] <- plug_in_estimator(bs_sample)
      }
      
      # helper functions=====================================================
      
      bias_correction <- function(bootstrap_estimates, 
                                  plug_in_estimate, 
                                  B){
        return(qnorm(sum(bootstrap_estimates < plug_in_estimate)/B))
      }
      
      acceleration_parameter <- function(data = log_data){
        
        th.jack <- sapply(1:n, function(x){plug_in_estimator(data[-x])})
        
        L <- mean(th.jack) - th.jack
        
        return( sum(L^3)/(6 * sum(L^2)^1.5) )
      }
      
      alpha <- function(confid = .975, 
                        bootstrap_estimates = theta_hat_star,
                        plug_in_estimate = plug_in_estimate,
                        data = log_data){
        
        bc <- bias_correction(bootstrap_estimates = bootstrap_estimates,
                              plug_in_estimate = plug_in_estimate, 
                              B = B)
        
        ap <- acceleration_parameter(data)
        
        return(pnorm(bc + (bc + qnorm(confid))/(1-(ap*(bc + qnorm(confid))))))
      }
      
      BC_a <- function(confid = .975, 
                       bootstrap_estimates = theta_hat_star,
                       plug_in_estimate = plug_in_estimate
      ){
        return(c(quantile(bootstrap_estimates,
                          alpha(1-confid,
                                bootstrap_estimates = bootstrap_estimates,
                                plug_in_estimate = plug_in_estimate)),
                 quantile(bootstrap_estimates,
                          alpha(confid,
                                bootstrap_estimates = bootstrap_estimates,
                                plug_in_estimate = plug_in_estimate))))
      }
      
      # BCa for mean computation ============================================
      
      plug_in_estimate <- plug_in_estimator(log_data)
      
      theta_BCa <- BC_a(confid = .975,
                        bootstrap_estimates = theta_hat_star,
                        plug_in_estimate = plug_in_estimate)
      
      # exp(theta_BCa): 213.9662  1448.1354 