    X <- as.matrix(cbind(1, 
                         researcher_salary$X_i1, 
                         researcher_salary$X_i2, 
                         researcher_salary$X_i3))
    
    y <- as.matrix(researcher_salary$Y_i)
    
    # BOOTSTRAP ESTIMATE =======================================================
    # 0.03718712

    # Step 1: Calculate beta_hat and sigma2_squared_mle
    beta_hat <- solve(t(X)%*%X)%*%t(X)%*%y
    resid <- y - X %*% beta_hat
    sigma2_squared_lse <- (t(resid) %*% resid) / (n - ncol(X))
    
    # Step 2.a: Generate bootstrap samples
    set.seed(seed) 
    y_star_list <- lapply(
      1:B,
      function(x) {
        X%*%beta_hat + as.matrix(rnorm(n, 
                                       mean = 0, 
                                       sd = sqrt(sigma2_squared_lse)))
      }
    )
    
    # Step 2.b: Calculate beta_2_star
    beta_2_star <- sapply(y_star_list, 
                          function(y_star) {
                            (solve(t(X)%*%X)%*%t(X)%*%y_star)[3]
                            }
                          )
    
    # Step 3: Get the sd of Calculate beta_2_star's
    sd_boot <- sd(beta_2_star)
    
    # USUAL ESTIMATE (see references section for code source) ==================
    # 0.03710865
    
    vcov_beta_hat <- c(sigma2_squared_lse) * solve(t(X) %*% X)
    sd_usual <- sqrt(diag(vcov_beta_hat))[3]
    