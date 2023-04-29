      fishery <- (
        read.csv("../../../problems/midterm/datasets/fishery.csv"
                 )*1000)^(-1)
      colnames(fishery) <- c("Y", "X")
      
      n <- nrow(fishery)
      X <- as.matrix(cbind(1,fishery$X))
      y <- as.matrix(fishery$Y)