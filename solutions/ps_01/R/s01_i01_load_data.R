# loading the dataset to be used
# print(getwd()) - /home/scientists/sci01/Projects/bootstrap/solutions/ps_01/child
data <- "../../../problems/ps_01/datasets/law_school_data.Rds"
if (file.exists(data)) {
  print(paste(c("The file exists; loading", data), collapse = ' '))
  load(data)
} else {
  paste(c("The file does not exist; creating, loading and saving", data), collapse = ' ')
  law_school_data <- data.frame(
    'School' = 1:15,
    'LSAT' = c(576,635,558,578,666,580,555,661,651,605,653,575,545,572,594),
    'GPA' = c(3.39,3.30,2.81,3.03,3.44,3.07,3.00,3.43,3.36,3.13,3.12,2.74,2.76,2.88,2.96)
  )
  save(law_school_data,file=data)
}
rm(data)

