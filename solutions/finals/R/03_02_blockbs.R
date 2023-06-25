      M <- 10000
      n <- length(earthquake)
      b <- 9 
      k <- ceiling(n/b)
      
      acf1_star <- c()
      set.seed(seed)
      for (i in 1:M) {
        boot <- c()
        for (j in 1:k) {
          left <- sample(seq(1, n, b), 1, replace = TRUE)
          boot_s <- earthquake[left:(left + b - 1)]
          boot <- append(boot, boot_s)
        }
        acf1_star[i] <- get_acf1(boot)
      }
      
      # sd(acf1_star): 0.1036793