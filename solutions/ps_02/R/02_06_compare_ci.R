    hist(theta_1_hat_star,
         prob = TRUE,
         main = expression(paste("Density of ", hat(theta)[1], "*")),
         xlab = expression(paste(hat(theta)[1], "*")),
         ylim = range(density(theta_1_hat_star)$y, density(theta_1_hat_star)$y))
    
    lines(density(theta_1_hat_star))
    
    box(col = "black")   
    
    abline(v=theta_1_pci[1],lty="dashed")
    abline(v=theta_1_pci[2],lty="dashed")
    text(theta_1_pci[2]+0.005, 6, expression(paste("%", ile)), cex=0.7)
    
    abline(v=theta_1_BCa[1],lty="dotted")
    abline(v=theta_1_BCa[2],lty="dotted")
    text(theta_1_BCa[2]+0.005, 6, expression(BC[a]), cex=0.7)
