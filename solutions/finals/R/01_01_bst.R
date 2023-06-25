      data <- c(24, 40, 719, 727, 791, 1166, 1235, 1581, 1804, 3460, 3808)
      log_data <- log(data)
      sample_mean <- mean(log_data)
      seed <- 7
      B1 <- 1000
      B2 <- 25
      n <- length(data)
      
      bootstrap_fn <- function(data = log_data, meth = "percentile") {
        # taking 1st level boot
        boot <- sample(data, n, replace = TRUE)

        est_boot <- mean(boot)
        if (meth == "percentile") {
          return(est_boot)
        } else if (meth == "bootstrap_t") {
          sample_est <- mean(data)
          #taking 2nd level boot
          est_boot2 <- replicate(B2, {
            boot2 <- sample(data, n, replace = TRUE)
            mean(boot2)
          })
        }
        
        se_boot <- sd(est_boot2)
        t_boot <- (est_boot - sample_est) / se_boot
        result_list <- list(r = est_boot, t = t_boot)
        return(result_list)
      }
      
      set.seed(seed)
      res = sapply(1:B1, function(.){bootstrap_fn(data = log_data, 
                                                  meth = "bootstrap_t")})
      ses <- unlist(res[1,]); tbs <- unlist(res[2,])
      se_mean <- sd(ses) #bootstrap estimate of the SE
      lower <- sample_mean - quantile(tbs,.975)*se_mean
      upper <- sample_mean - quantile(tbs,.025)*se_mean
      
      #c(exp(lower),exp(upper)): 296.8853 2034.9199 