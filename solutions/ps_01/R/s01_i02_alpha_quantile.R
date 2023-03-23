source("../R/s02_i01_bs_sampling.R")
#print(getwd())
quant <- quantile(r,
                  probs = c(0.05, 0.10, 0.15, 0.20, 0.50, 0.70, 0.85, 0.90, 0.95), 
                  names = TRUE)

print(quant)
print(max(r))






robust_se <- function(quantile_vector, alpha) {
  #return((quantile_vector[names(quantile_vector) == paste0(as.character(alpha*100),"%")] - quantile_vector[names(quantile_vector) == paste0(as.character(1-alpha*100),"%")])/2*qnorm(alpha))
  return((quantile_vector[names(quantile_vector) == paste0(as.character(alpha*100),"%")] - quantile_vector[names(quantile_vector) == paste0(as.character((1-alpha)*100),"%")])/2*qnorm(alpha))
  } 

#print(robust_se(quantile_vector=quant, alpha =0.95))

print(lapply(c(0.95, 0.90, 0.85), function(x){robust_se(quant, alpha = x)}))


source("../R/s03_i01_max_value.R")

quant_replaced <- quantile(r_replaced,
                  probs = c(0.05, 0.10, 0.15, 0.20, 0.50, 0.70, 0.85, 0.90, 0.95), 
                  names = TRUE)

print(lapply(c(0.95, 0.90, 0.85), function(x){robust_se(quant_replaced, alpha = x)}))
print(max(r_replaced))
