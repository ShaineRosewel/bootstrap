      earthquake <- read.csv("earthquake.csv")
      earthquake<-ts(earthquake, start = 1990, frequency = 1)
      
      annual_change <- diff(earthquake, lag = 1)
      n <- length(annual_change)

      get_acf1 <- function(earthquake_data){
        annual_change <- diff(earthquake_data, lag = 1)
        n <- length(annual_change)
        
        num <- c(); den <- c()
        for (t in 2:n) {
          num[t-1] <- (
            annual_change[t] - mean(annual_change)
            )*(
              annual_change[t-1] - mean(annual_change)
            )
        }
        
        for (t in 1:n) {
          den[t] <- (annual_change[t] - mean(annual_change))^2
        }
        return(sum(num)/sum(den))
      }
      
      # get_acf1(earthquake): -0.3661926