      source("../R/01_00_load_data.R")
      print(seed)
      get_theta_hat_star <- function(sufficient_stat = 'mean') {
        
        # step 1
        if (sufficient_stat == "mean") {
          lambda_X <- mean(microbiology$X)
          lambda_Y <- mean(microbiology$Y)
        } else if (sufficient_stat == "sum")  {
          lambda_X <- sum(microbiology$X)
          lambda_Y <- sum(microbiology$Y)
        }
        
        # step 2
        set.seed(seed)
        B_starX <- replicate(B,rpois(n, lambda_X))
        set.seed(seed)
        B_starY <- replicate(B,rpois(n, lambda_Y))
        
        # step 3
        theta_hat_star <- colMeans(B_starX) - colMeans(B_starY)
        
        # step 4
        return(theta_hat_star)
      }
      
      suff1_theta_star <- get_theta_hat_star("mean")
      suff1_se <- sd(suff1_theta_star)
      
      suff2_theta_star <- get_theta_hat_star("sum")
      suff2_se <- sd(suff2_theta_star)
