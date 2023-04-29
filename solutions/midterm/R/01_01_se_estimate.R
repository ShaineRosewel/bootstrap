      get_theta_hat_star <- function(sufficient_stat = 'average') {
        
        # step 1
        if (sufficient_stat == "average") {
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
      
      suff_theta_star <- get_theta_hat_star("average")
      
      suff_se <- sd(suff_theta_star)
      #hist(
      #  suff_theta_star,
      #  main = expression(paste("Histogram of ", hat(theta), "*")),
      #  xlab = expression(paste(hat(theta), "*")),
      #)
      suff_ci <- c(
        quantile(suff_theta_star,.025),
        quantile(suff_theta_star,.975)
        )
