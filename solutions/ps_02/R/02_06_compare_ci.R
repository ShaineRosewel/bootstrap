    hist(theta_1_hat_star,
         prob = TRUE,
         main = expression(paste("Density of ", hat(theta)[1], "*")),
         xlab = expression(paste(hat(theta)[1], "*")),
         ylim = range(density(theta_1_hat_star)$y, density(theta_1_hat_star)$y))
    
    lines(density(theta_1_hat_star))
    
    box(col = "black")   
    
    abline(v=theta_1_pci[1],lty="dashed")
    abline(v=theta_1_pci[2],lty="dashed")
    text(theta_1_pci[2]-0.01, 6, expression(paste("%", ile)), cex=0.7)
    
    abline(v=theta_1_BCa[1],lty="dotted")
    abline(v=theta_1_BCa[2],lty="dotted")
    
    #abline(v=mean(theta_1_hat_star))
    #abline(v=plug_in_estimate_theta_1)
    text(theta_1_BCa[2]+0.01, 5, expression(BC[a]), cex=0.7)
