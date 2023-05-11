    survival_times <- c(10, 27, 30, 40, 46, 51, 52, 104, 146)
    sample_median <- median(survival_times)
    seed <- 7
    B1 <- 1000
    B2 <- 50
    n <- 9
    
    bootstrap_fn <- function(estimate = "median", meth = "percentile") {
      # taking 1st level boot
      survival_boot <- sample(survival_times, n, replace = TRUE)
      
      if (estimate == "median") {
        est_boot <- median(survival_boot)
        if (meth == "percentile") {
          return(est_boot)
        } else if (meth == "bootstrap_t") {
          sample_est <- median(survival_times)
          # taking 2nd level boot
          est_boot2 <- replicate(B2, {
            survival_boot2 <- sample(survival_boot, n, replace = TRUE)
            median(survival_boot2)
          })
        }
      } else if (estimate == "mean") {
        est_boot <- mean(survival_boot)
        if (meth == "percentile") {
          return(est_boot)
        } else if (meth == "bootstrap_t") {
          sample_est <- mean(survival_times)
          #taking 2nd level boot
          est_boot2 <- replicate(B2, {
            survival_boot2 <- sample(survival_boot, n, replace = TRUE)
            mean(survival_boot2)
          })
        }
      }
      
      se_boot <- sd(est_boot2)
      t_boot <- (est_boot - sample_est) / se_boot
      result_list <- list(r = est_boot, t = t_boot)
      return(result_list)
    }