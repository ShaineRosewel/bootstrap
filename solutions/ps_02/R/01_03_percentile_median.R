    set.seed(seed)
    res_median = sapply(1:B1, function(.){bootstrap_fn(estimate = "median", 
                                                       meth = "percentile")})
    #c(quantile(res_median,.025), quantile(res_median,.975))