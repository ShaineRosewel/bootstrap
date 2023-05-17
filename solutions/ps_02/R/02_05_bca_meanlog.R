    plug_in_estimate_theta_2 <- plug_in_estimator(spatial_test_data$A, 
                                                  spatial_test_data$B, 
                                                  est = "theta_2")
    
    theta_2_BCa <- BC_a(confid = .975,
                        est = "theta_2",
                        bootstrap_estimates = theta_2_hat_star,
                        plug_in_estimate = plug_in_estimate_theta_2)
    
    #theta_2_BCa