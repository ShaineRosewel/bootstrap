    data <- "../../../problems/ps_02/datasets/spatial_test_data.RData"
    
    if (file.exists(data)) {
      print(paste(c("The file exists; loading", data), collapse = ' '))
      load(data)
    } else {
      paste(c("The file does not exist; creating, loading and saving", data), 
            collapse = ' ')
      spatial_test_data <- data.frame(
        'i' = 1:26,
        'A' = c(48, 36, 20, 29, 42, 42, 20, 42, 22, 41, 45, 14, 6, 
                0, 33, 28, 34, 4, 32, 24, 47, 41, 24, 26, 30, 41),
        'B' = c(42, 33, 16, 39, 38, 36, 15, 33, 20, 43, 34, 22, 7,
                15, 34, 29, 41, 13, 38, 25, 27, 41, 28, 14, 28, 40)
      )
      n1 <- dim(spatial_test_data)[1]
      seed <- 7
      
      save(spatial_test_data, seed, n1, file=data)
    }
    
    rm(data)
    
