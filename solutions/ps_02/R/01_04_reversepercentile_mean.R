    set.seed(seed)
    res_mean = sapply(1:B1, function(.){bootstrap_fn(estimate = "mean", 
                                                     meth = "percentile")})
    #c(2*sample_mean - quantile(res_mean,.975), 
    #  2*sample_mean - quantile(res_mean,.025))
    
    