      caffeine_data <- data.frame(
        'baseline' = c(6.37, 5.69, 5.58, 5.27, 5.11, 4.89, 4.70, 3.53),
        'caffeine' = c(4.52, 5.44, 4.70, 3.81, 4.06, 3.22, 2.96, 3.20)
      )
      
      n <- nrow(caffeine_data)
      d <- caffeine_data$baseline - caffeine_data$caffeine
      x.bar <- mean(d); d_tilde <- d-x.bar # transformed
      mean_d_tilde <- mean(d_tilde)
      sigma_d_tilde <- sqrt(sum((d_tilde-mean_d_tilde)^2)/(n-1))
      t_obs_d_tilde <- mean_d_tilde/(sigma_d_tilde/sqrt(n))
      
      indicator <- c() #1 if the statement is TRUE, 0 if FALSE
      set.seed(seed)
      for(b in 1:B){
        caffeine_data_boot <- caffeine_data[sample(nrow(caffeine_data), 
                                                   n, TRUE), ]
        d <- caffeine_data_boot$baseline - caffeine_data_boot$caffeine
        x.bar <- mean(d)
        d_tilde <- d-x.bar
        mean_d_tilde <- mean(d_tilde)
        sigma_d_tilde <- sqrt(sum((d_tilde-mean_d_tilde)^2)/(n-1))
        t_b <- mean_d_tilde/(sigma_d_tilde/sqrt(n))
        
        indicator[b] <- abs(t_b) >= abs(t_obs_d_tilde)
      }
      
      # sum(indicator)/B: 0.508