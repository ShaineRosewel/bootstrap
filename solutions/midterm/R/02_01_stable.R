      # OLS estimate
      beta_hat <- solve(t(X)%*%X)%*%t(X)%*%y
      
      # stable state values
      R_0 <- 1/(beta_hat[1]/(1-beta_hat[2]))
      S_0 <- 1/(((beta_hat[1]/(1-beta_hat[2]))-beta_hat[1])/beta_hat[2])