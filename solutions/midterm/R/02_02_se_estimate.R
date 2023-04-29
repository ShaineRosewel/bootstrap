      y_hat <- X%*%beta_hat
      resid <- y - y_hat
      
      S_0_star <- c()
      for(b in 1:2000){
        # take bootstrap sample
        resample_star <- sample(resid,n,replace=T)
        
        # calculate new y from the resample
        y_star <- y_hat + resample_star
        
        # solve for the OLS estimate
        beta_hat_star <- solve(t(X)%*%X)%*%t(X)%*%y_star
        
        # use the OLS estimate to calculate the stable state value
        S_0_star[b] <- 1/(
          (
            (beta_hat_star[1]/(1-beta_hat_star[2]))-beta_hat_star[1]
            )/beta_hat_star[2]
          )
      }
      
      stable_se <- sd(S_0_star)
      #hist(
      #  S_0_star,
      #  main = expression(paste("Histogram of ", hat(S)[0], "*")),
      #  xlab = expression(paste(hat(S)[0], "*")))
      stable_ci <- c(
        quantile(S_0_star,.025),
        quantile(S_0_star,.975)
        )