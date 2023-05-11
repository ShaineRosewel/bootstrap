    set.seed(seed)
    res_mean = sapply(1:B1, function(.){bootstrap_fn(estimate = "mean", 
                                                     meth = "percentile")})
    #c(quantile(res_mean,.025),quantile(res_mean,.975))