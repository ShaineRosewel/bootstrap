      data <- "../../../problems/midterm/datasets/microbiology.RData"
      
      if (file.exists(data)) {
        print(paste(c("The file exists; loading", data), collapse = ' '))
        load(data)
      } else {
        paste(c("The file does not exist; creating, loading and saving", data), 
              collapse = ' ')
        microbiology <- data.frame(
          'i' = 1:8,
          'X' = c(176, 125, 152, 180, 159, 168, 160, 151),
          'Y' = c(164, 121, 137, 169, 144, 145, 156, 139)
        )
        n <- dim(microbiology)[1]
        seed <- 7
        B <- 2000
        save(microbiology, n, B, seed,file = data)
      }
      
      rm(data)
      
