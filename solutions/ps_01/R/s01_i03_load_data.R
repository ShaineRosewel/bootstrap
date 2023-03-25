# Dataset for item 1 & 2
# wd: /home/scientists/sci01/Projects/bootstrap/solutions/ps_01/child
data <- "../../../problems/ps_01/datasets/researcher_salary.RData"
if (file.exists(data)) {
  print(paste(c("The file exists; loading", data), collapse = ' '))
  load(data)
} else {
  paste(c("The file does not exist; creating, loading and saving", data), 
        collapse = ' ')
  researcher_salary <- data.frame(
    'i' = 1:24,
    'X_i1' = c(3.5, 5.3, 5.1, 5.8, 4.2, 6.0, 6.8, 5.5, 3.1, 7.2, 4.5, 4.9, 
               8.0, 6.5, 6.6, 3.7, 6.2, 7.0, 4.0, 4.5, 5.9, 5.6, 4.8, 3.9),
    'X_i2' = c(9,20,18,33,31,13,25,30,5,47,25,11,
               23,35,39,21,7,40,35,23,33,27,34,15),
    'X_i3' = c(6.1,6.4,7.4,6.7,7.5,5.9,6.0,4.0,5.8,8.3,5.0,6.4,
               7.6,7.0,5.0,4.4,5.5,7.0,6.0,3.5,4.9,4.3,8.0,5.0),
    'Y_i' = c(33.2,40.3,38.7,46.8,41.4,37.5,39.0,40.7,30.1,52.9,38.2,31.8,
              43.3,44.1,42.8,33.6,34.2,48.0,38.0,35.9,40.4,36.8,45.2,35.1)
  )
  
  n <- dim(researcher_salary)[1]
  save(researcher_salary, n, file = "researcher_salary.RData")
}
rm(data)

