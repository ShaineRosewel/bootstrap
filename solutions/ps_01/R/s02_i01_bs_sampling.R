    # set seed for reproducibility
    set.seed(seed)
    
    r <-
      # Step 2: take the pearson correlation for each bootstrap sample
      sapply(
        # Step 1: 2000 bootstrap samples (with replacement) of size 15
        lapply(
          1:2000, 
          function(argu){ law_school_data[sample(law_school_data$School, 
                                              15,  
                                              replace = TRUE), 
                                       c(2,3)] }
        ),
        function(r_star){cor(r_star$LSAT,r_star$GPA, method = "pearson")}
      )
    
    # Step 3: take the bootstrap estimate of the standard error
    se_r_boot <- sd(r)
    
    # take the percentile 95% CI for r
    ci_r_boot <- c(quantile(r,.025),quantile(r,.975))
