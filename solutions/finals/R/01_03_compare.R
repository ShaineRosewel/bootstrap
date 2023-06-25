      plot(density(ses), 
           ylim = range(density(ses)$y, density(ses)$y), 
           lty = 'dashed', main = "Bootstrap Density Plot", xlab = '')
      lines(density(theta_hat_star), lwd = 0.25)
      
      abline(v=theta_BCa[1], lwd = 0.25)
      abline(v=theta_BCa[2], lwd = 0.25)
      
      abline(v=lower,lty = 'dashed')
      abline(v=upper,lty = 'dashed')
      
      text(7.9, 0.8, "BSt    ---", cex=0.6)
      text(7.9, 0.75, "BCa   __", cex=0.6)
      title(sub="Note: values not yet exponentiated")