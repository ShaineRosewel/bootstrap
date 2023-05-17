    plot(density(res_median), 
         ylim = range(density(res_median)$y, density(ses)$y), 
         lty = 'dashed', main = "Bootstrap Density Plot", xlab = '')
    lines(density(res_mean), lty = 'dotted')
    
    abline(v=2*sample_mean - quantile(res_mean,.975),col="orange")
    abline(v=2*sample_mean - quantile(res_mean,.025),col="orange")
    text(2*sample_mean - quantile(res_mean,.975)+6, 0.066,
         expression(paste("%il", e[rev])), cex=0.7)
    
    abline(v=quantile(res_median,.025),col="lightgreen")
    abline(v=quantile(res_median,.975),col="lightgreen")
    text(quantile(res_median,.975), 0.072,
         expression(paste("%", ile)), cex=0.7)
    
    abline(v=quantile(lower,.025),col="violet")
    abline(v=quantile(upper,.975),col="violet")
    text(quantile(lower,.025)-1, 0.06, expression(BS[t]), cex=0.7)
    
    text(140, 0.06, "median ---", cex=0.7)
    text(139.5, 0.055, "mean   ...", cex=0.7)