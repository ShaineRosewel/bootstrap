    set.seed(seed)
    res = sapply(1:B1, function(.){bootstrap_fn(estimate = "median", 
                                                meth = "bootstrap_t")})
    ses <- unlist(res[1,])
    tbs <- unlist(res[2,])
    
    se_median <- sd(ses) #bootstrap estimate of the SE
    lower <- sample_median - quantile(tbs,.975)*se_median
    upper <- sample_median - quantile(tbs,.025)*se_median
    #c(lower,upper)