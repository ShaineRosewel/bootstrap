Basic Ideas
================

## Motivation

- Let $\mathbf{x}: x_1, \dots, x_n$ be iid from some distribution
  $F(\cdot)$, indexed by $\theta$ (i.e., $F(\cdot)$), where $\theta$ is
  unknown. (*F is unknown is nonparametric but F is known w/ parameter
  unknown is parametric*)
- Suppose we are to make an inference about $\theta$, with that we also
  wish to have a measure of precision so we get an estimator for
  $\theta$, $\hat{\theta} = \hat{\theta}(\mathbf{x})$ (a fcn of vector
  $\mathbf{x}$) and compute for its standard error. We might have an
  estimator or a formula available for $\hat{\theta}$ but most of the
  time we don’t have a formula for the following - it is where bootstrap
  becomes useful.
  - $se(\hat{\theta})$
  - CI for $\theta$ based on $\hat{\theta}$
  - CDF: $P(\hat{\theta} \leq x)$
  - quantiles of $\hat{\theta}$
- Recall:
  - $se(\hat{\theta}) = \sqrt{V(\hat{\theta})}$ (*sq of var of
    estimator; variance is also not directly available.*)
  - CI: normal approximation to the CI for
    $\hat{\theta} \pm 1.96 \ se(\hat{\theta})$

### Example 1: Population mean estimation

- Let the (expected value/ first raw moment) $\theta = E(X_i) = \mu$.
  This has an available formula for $se$.
- Its common estimator: $\hat{\theta} = \hat{X} \longrightarrow \mu$
  (converges to $\mu$ a.s. and in probability by WLLN; also
  asymptotically normally distributed)
- $se(\hat{\theta}) = \frac{\sigma}{\sqrt{n}}$ where $\sigma$
  (population sd) can be estimated using
  $\hat{\sigma} = \sqrt \frac{\sum(X_i-\bar{X})^2}{n-1}$
- approximate CI for $\mu$:
  $\bar{X} \pm 1.96 \ \hat{se}(\hat{\theta}) = \bar{X} \pm 1.96 \ \frac{\hat{\sigma}}{\sqrt{n}}$

### Example 2: Boostrap solution

#### Example 2.1: Population median estimation

- Let the median (50th quantile) of $F$ be $\theta = q_{0.50}$.
- Its natural estimator: $\hat{\theta}$ (sample median)
- $se(\hat{\theta})$ (se of median) has no readily available formula!
- CI for median?

#### Example 2.2: Using Trimmed mean to estimate population mean

- Let the (expected value/ first raw moment) $\theta = E(X_i) = \mu$.
  This has NO available formula for $se$ when estimated using the
  trimmed mean.

## Bootstrap

### Fictitious case

Suppose $F(\cdot)$ is known (CDF/ distribution is known), $\theta$
parameter is also known (*this is fictitious since in reality $F(\cdot)$
may be known but $\theta$ is not (parametric case)*). To get the
$se(\hat{\theta})$ in this case, we can just sample many times from
$F(\cdot)$:

Sample 1:
$X_1, \dots, X_n \sim F(\cdot; \theta) \longrightarrow \hat{\theta}_1$
Sample 2:
$X_1, \dots, X_n \sim F(\cdot; \theta) \longrightarrow \hat{\theta}_2$
$\vdots$ Sample B:
$X_1, \dots, X_n \sim F(\cdot; \theta) \longrightarrow \hat{\theta}_B$

Forming the histogram of $\hat{\theta}_b's$ gives us the sampling
distribution of $\hat{\theta}$.

*Note that we do not do this in real life, if we know the dist and the
parameter (Here, we are sampling from the true distribution
$F(\cdot; \theta)$.), we do not need to estimate anything - only to
illustrate how to take $se(\hat{\theta})$ even if formula DNE*

Note that we do not have a formula for $se(\hat{\theta})$ but a simple
formula for **estimating** it is by using

$$
se(\hat{\theta}) = \sqrt \frac{\sum(\hat{\theta}_i-\bar{\hat{\theta}})^2}{B-1};\ \ \bar{\hat{\theta}} = \frac{1}{B}\sum^B_{i=1} \hat{\theta}_i
$$

The above formula is still an estimation (hence, it is more proper to
write it using $\hat {se}(\hat{\theta})$), it converges in probability
to the true standard error of $\hat{\theta}$ as $B \rightarrow \infty$

#### Problems

- $F$ might not be known (or at least not completely)  

- $\theta$ is unknown and so needed to be estimated  

- We do not have the luxury of taking many samples from the population,
  we do not have resources to take more than one random sample. We can
  only make the most out of the only sample that we have. We might need
  to replace the population dist $F$ with an estimate $\hat{F}$ i.e. we
  would have to estimate the PDF (equivalently estimating the CDF)
  (because we do not know the true PDF) by **sampling from the CDF**.

  - Sample 1:
    $X_1, \dots, X_n \sim \hat F(\cdot; \theta) \longrightarrow \hat{\theta_1}$  
  - Sample 2:
    $X_1, \dots, X_n \sim \hat F(\cdot; \theta) \longrightarrow \hat{\theta}_2$  
    $\vdots$
  - Sample B:
    $X_1, \dots, X_n \sim \hat F(\cdot; \theta) \longrightarrow \hat{\theta}_B$

#### Case 1: Form of $F$ is unknown

This is the nonparametric case; nothing is assumed about the
distribution

##### 1. What does it mean to estimate your CDF, $F$?

Aside: Recall: properties of CDF: $\lim_{x \to \infty} F(x) = 1$,
$\lim_{x \to -\infty} F(x) = 0$; right continuous, non-decreasing.

We **estimate using empirical CDF**, denoted \$. Suppose
$\{1, 3, 3, 4, 5\}$. Find the CDF.

$$
  \alpha(x)=\left\{
              \begin{array}{ll}
                \frac{0}{5}; \quad  x < 1 \\
                \frac{1}{5};\quad 1 \leq x < 3 \\
                \frac{3}{5}; \quad 3 \leq x < 4 \\
                \frac{4}{5}; \quad 4 \leq x < 6 \\
                1; \quad x \geq 6
              \end{array}
            \right.
$$

<p style="font-size:10px;">
Aside from ChatGPT: To calculate the cumulative distribution function
(CDF) of the dataset $\{1, 3, 3, 4, 5\}$, we need to first sort the data
in ascending order: $\{1, 3, 3, 4, 5\}$. Then, for each distinct value
in the dataset, we calculate the proportion of values that are less than
or equal to that value. This proportion is the cumulative probability up
to that value. For example, the value 1 is the smallest in the dataset
and is present only once. Since there are no values less than 1 in the
dataset, the proportion of values that are less than or equal to 1 is
1/5 or 0.2. This means that the cumulative probability up to 1 is 0.2.
The value 3 is present twice in the dataset. Since there is one value
less than 3 (namely 1), the proportion of values that are less than or
equal to 3 is (1+2)/5 or 0.6. This means that the cumulative probability
up to 3 is 0.6.Similarly, for the value 4, there are three values less
than or equal to it (namely 1, 3, and 3), so the proportion of values
that are less than or equal to 4 is (1+2+3)/5 or 0.8. This means that
the cumulative probability up to 4 is 0.8. Finally, for the largest
value 5, all values are less than or equal to it, so the proportion of
values that are less than or equal to 5 is 1. This means that the
cumulative probability up to 5 is 1. Thus, the CDF of the dataset {1, 3,
3, 4, 5} is 1,3,4,5 – 0.2, 0.6, 0.8, 1. The CDF shows the probability
that a value in the dataset is less than or equal to a certain value.
For example, the probability that a randomly selected value from the
dataset is less than or equal to 3 is 0.6, while the probability that it
is less than or equal to 5 is 1.0.
</p>

##### 2. What does it mean to sample from the empirical CDF?

This is sampling not from the population distribution $F(X)$ but from
some fitted distribution, $\hat{F}(X)$. Note that here, $\hat{F}(X)$ is
known, it has an available formula.

- Bootstrap sample 1:
  $X_1^*, \dots, X_n^* \sim \hat F(\cdot; \theta) \longrightarrow \hat{\theta_1^*}$  
- Bootstrap sample 2:
  $X_1^*, \dots, X_n^* \sim \hat F(\cdot; \theta) \longrightarrow \hat{\theta_2^*}$  
  $\vdots$
- Bootstrap sample B:
  $X_1^*, \dots, X_n^* \sim \hat F(\cdot; \theta) \longrightarrow \hat{\theta_B^*}$

where B = \# of bootstrap samples

**Bootstrap estimate of the SE**

$$
\widehat{se}(\hat{\theta}) = \sqrt \frac{\sum(\hat{\theta}_i^*-\bar{\hat{\theta}^*})^2}{B-1};\ \ \bar{\hat{\theta}^*} = \frac{1}{B}\sum^B_{i=1} \hat{\theta}_i^*
$$

**Bootstrap percentile CI for $\theta$**: quick & dirty
$(1-\alpha)100\%$ CI for $\theta$

$$
\left(\hat{\theta}^*_{\frac{\alpha}{2}}, \hat{\theta}^*_{1-\frac{\alpha}{2}} \right)
$$

where $\frac{\alpha}{2}$ is the sample quantile of
$\hat{\theta}_1, \dots, \hat{\theta}_B$. There are more accurate ways of
estimating the CI.

Contrary to sampling from the true distribution, where we just generate
samples from various distributions (e.g., normal, exponential, etc.),
sampling from the empirical CDF is SRSWR (with replacement to make sure
we are taking iid samples) from the original data. Size of bootstrap
sample has to be the same as that of the sample size.

In bootstrap, we try to mimic the process of getting the sampling
distribution. But we take that ONLY sample that we have as our new
population, generate B bootstrap samples from there, compute the
estimate and form the histogram: now the bootstrap distribution. i.e. 

**Bootstrap principle**: The sample becomes the new population, your
bootstrap samples become the new samples (follow this when forming the
algo)

**Other bootstrap estimates**

$$
bias(\hat{\theta}) = E(\hat{\theta} - \theta) = E(\hat{\theta}) - \theta \\
\widehat{bias}(\hat{\theta}) = \bar{\hat{\theta}^*} - \hat{\theta}
$$

$$
P\widehat{(\hat{\theta} \leq x)} = \frac{\# \{\hat{\theta}_i^* \leq x\}}{B} = \frac{\sum^B_{i=1} I\left( \hat{\theta}_i^* \leq x \right)}{B} \quad \text{just proportion}
$$

**Glivenko-Cantelli Theorem**

sup norm for distance between 2 CDFs (comparison of distributions) -
also seen in Kolmogorov-Smirnov test (goodness of fit test if
empirically follows specific dist)

$$
\sup_x \left| \hat F(x) - F(x)  \right| \underset{n \rightarrow \infty}{\longrightarrow}  0 \\
\hat {F}_n(x) \overset{unif}{\longrightarrow} F(x)
$$ If you can take all $n^n$ nonparametric bootstrap samples (right way
of doing BS), $\hat {se}(\hat{\theta})}$ based on all $n^n$, you get the
ideal bootstrap estimate of SE. (note, LLN). Ideally, $B = n^n$. In
practice $B \in \{500, 1000, 10000\}$. Take larger $B$ for nonparametric
case.

``` r
set.seed(100)

x <- c(94,  197,  16,  38,  99,  141,  23)
hist(x) # skewed to the right
```

![](00_lecture_notes_files/figure-gfm/unnamed-chunk-1-1.png)<!-- -->

``` r
summary(x)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   16.00   30.50   94.00   86.86  120.00  197.00

``` r
plot(ecdf(x)) # non parametric estimator of CDF
```

![](00_lecture_notes_files/figure-gfm/unnamed-chunk-1-2.png)<!-- -->

``` r
B <- 500 # number of bootstrap samples
n <- length(x) # bs size should be same as that of sample
#mean(x) #Mean
#median(x) #Median

sd(x)/sqrt(n) #Estimated standard error of mean
```

    ## [1] 25.23549

``` r
# we do not have a formula for the SE of median
```

``` r
set.seed(100)
mean.b <- c(); median.b <- c()
for (j in 1:500){
  boot.s <- sample(x,n,replace=TRUE) #SRSWR
  mean.b[j] <- mean(boot.s); median.b[j] <- median(boot.s)
}
sd(mean.b)  #Bootstrap estimate of the standard error of sample mean
```

    ## [1] 22.8218

``` r
sd(median.b) #Bootstrap estimate of the standard error of sample median
```

    ## [1] 36.91856

``` r
hist(mean.b,main='Histogram of bootstrap means')
```

![](00_lecture_notes_files/figure-gfm/bootstap_calculation-1.png)<!-- -->

``` r
hist(median.b,main='Histogram of bootstrap medians')
```

![](00_lecture_notes_files/figure-gfm/bootstap_calculation-2.png)<!-- -->

SE of mean \< SE of median. This follows from the fact that mean is BLUE
(among all unbiased estimator, it has the lowest variance). Median is
also an unbiased estimator of the population mean but then it has a
larger variance (SD).

Note: histogram of means is symmetric (gets close to normal), unlike the
original sample and unlike the histogram of the median due to Central
Limit Theorem (CLT).

#### Case 2: Form of $F(\cdot)$ is known/assumed, except the parameter

This is the parametric case. We do not do SRSWR, we sample from the
plug-in distribution (parametric bootstrap). $F$is known and $\theta$ is
unknown meant we can estimate (Least squares, MLE) $\theta$.
${\hat{\theta}}$ (could be a vector) should be a sufficient statistic
(jointly sufficient, if vector).

**example:** Let $F(\cdot)$ be the CDF $\mathcal{N}(\mu, \sigma^2)$ but
$\mu, \sigma^2$ are unknown.

**How to estimate $se(\hat{\theta})$**

Bootstrap sample 1:
$X_1^*, \dots, X_n^* \sim F(\cdot; \hat \theta) \longrightarrow \hat{\theta}_1^*$
Bootstrap sample 2:
$X_1^*, \dots, X_n^* \sim F(\cdot; \hat \theta) \longrightarrow \hat{\theta}_2^*$
$\vdots$ Bootstrap sample B:
$X_1^*, \dots, X_n^* \sim F(\cdot; \hat \theta) \longrightarrow \hat{\theta}_B^*$

**Bootstrap estimate of the SE**

$$
\widehat{se}(\hat{\theta}) = \sqrt \frac{\sum(\hat{\theta}_i^*-\bar{\hat{\theta}^*})^2}{B-1};\ \ \bar{\hat{\theta}^*} = \frac{1}{B}\sum^B_{i=1} \hat{\theta}_i^*
$$

**Bootstrap percentile 95% CI for $\theta$**: quick & dirty
$(1-\alpha)100\%$ CI for $\theta$ ($\hat{\theta}^*_{0.025}$ is the
0.025th quantile of $\{\hat{\theta}_1^*, \dots, \hat{\theta}_B^*\}$)

$$
\left(\hat{\theta}^*_{\frac{\alpha}{2}}, \hat{\theta}^*_{1-\frac{\alpha}{2}} \right) = \left(\hat{\theta}^*_{0.025}, \hat{\theta}^*_{0.975} \right) 
$$

$$
bias(\hat{\theta}) = E(\hat{\theta} - \theta) = E(\hat{\theta}) - \theta \\
\widehat{bias}(\hat{\theta}) = \bar{\hat{\theta}^*} - \hat{\theta}
$$

$$
P\widehat{(\hat{\theta} \leq x)} = \frac{\# \{\hat{\theta}_i^* \leq x\}}{B} = \frac{\sum^B_{i=1} I\left( \hat{\theta}_i^* \leq x \right)}{B} \quad \text{just proportion}
$$

**Example (Casella & Berger):** Let $X_1 \dots X_n$ (distribution is
known)

``` r
data <- c(-1.81, 0.63, 2.22, 2.41, 2.95, 4.16, 4.24, 4.53, 5.09)
mean(data)
```

    ## [1] 2.713333

``` r
(sd(data))^2
```

    ## [1] 4.820575

Aside: sd formula in the code
$\hat{\sigma} = \sqrt \frac{\sum(X_i-\bar{X})^2}{n-1}$

Goal: Estimate the variance of $S^2$ $s^2$ is a statistic, hence has
sampling distribution so we can talk about the variance of its sampling
distribution. $V(S^2)$ becomes a parameter when we talk of sampling
distribution of $S^2$. Take square root to get the SE.

Estimate using “MLE”

Recall: The true variance formula below follows from
$\frac{(n-1)S^2}{\sigma^2} \sim \chi^2_{n-1}$

$$
V(S^2) = \frac{2\sigma^4}{n-1}
$$

We cannot calculate it since $\sigma$ is unknown. We can use the “MLE”
(not really the MLE since denominator is not $n$)

$$
\widehat{V(S^2)} = \frac{2 \hat \sigma^4}{n-1} = \frac{2\left(\sqrt{4.82}\right)^4}{9-1} =5.81
$$

Estimate using bootstrap:

Algorithm:

1.  Compute $\hat \mu = \bar X = 2.71$ and $\hat \sigma^2 = 4.82$

2.  Sample

    boot sample 1:
    $X_1, \dots, X_n^* \sim \mathcal{N}(\bar X, \hat \sigma^2) \equiv \mathcal{N}(2.71, 4.82) \rightarrow \hat {\theta}_1^*$
    boot sample 2:
    $X_1, \dots, X_n^* \sim \mathcal{N}(\bar X, \hat \sigma^2) \equiv \mathcal{N}(2.71, 4.82) \rightarrow \hat {\theta}_2^*$
    $\vdots$ boot sample 500:
    $X_1, \dots, X_n^* \sim \mathcal{N}(\bar X, \hat \sigma^2) \equiv \mathcal{N}(2.71, 4.82) \rightarrow \hat {\theta}_{500}^*$

    where
    $\hat {\theta}_i^* = S_i^{*2} = \frac{\sum_{j=1}^N(X_j^*-\bar{X}^*)^2}{n-1}$
    (sample variance for each boot sample)

3.  Boot estimate for $V(S^2)$: $\hat V(S^2)$

$$
\hat V(S^2) = \frac{\sum_{i=1}^B\left(S_i^{*2}-\bar{S}^{*2}\right)^2}{B-1}
$$

R calculation bs estimate: $\hat V(S^2) = 4.33$

Recall: “MLE” = 5.81

True $\sigma^2$:

$$
v(s^2) = \frac{2\sigma^4}{n-1} = \frac{2(4^4)}{9-1} = 4 \quad \text{true value closer to bs estimate than MLE}
$$

**Example (Efron & Tibshirani):** (parametric; distribution is known but
parameters are not)

Data: $\{ (X_1, Y_1), \dots, (X_n, Y_n)\}$ Recall
$(X, Y)' \sim \text{bivar}\mathcal{N} \left(\mu_x, \mu_y, \sigma^2_x, \sigma^2_y, \rho\right)$,
the joint density (pdf) is

\$\$ f\_{(X,Y)}(x,y) = { - }

\$\$

Its CDF has no closed form but we know its integral form.

$\hat{\rho}$ (coefficient of correlation; measures strength of linear
relationship bet x and y) is usually estimated using the pearson product
moment coefficient of correlation $r$.

$$
\hat{\rho} = r = \frac{\sum(X_i - \bar{X})(Y_i-\bar{Y})}{\sqrt{\sum(X_i - \bar{X})^2\sum(Y_i - \bar{Y})^2}}
$$ There is no direct way to calculate the precision for
$se(\hat{\rho}) = se(r)$ but we can compute this using bootstrap.

Algorithm (parametric bs to estimate $se(\hat{\rho})$):

1.  Compute
    $\hat \mu_X = \bar X, \ \hat \mu_Y = \bar Y, \, \ \hat \sigma^2_X = S^2_X, \ \hat \sigma^2_Y = S^2_Y, \ \hat \rho = r$.
    Note that $\left(\bar Y, \bar X, S^2_X, S^2_Y, r\right)$ is jointly
    sufficient for the set of parameters.

2.  Generate sample pairs (bivariate samples) from the plug-in
    distribution,  
    $(X^*_{11}, Y^*_{11}), (X^*_{21}, Y^*_{21}), \dots, (X^*_{n1}, Y^*_{n1}) \sim BVN\left(\hat \mu_x, \hat \mu_y, \hat \sigma^2_x, \hat \sigma^2_y, \hat \rho\right) \rightarrow r^*_1$  
    $(X^*_{12}, Y^*_{12}), (X^*_{22}, Y^*_{22}), \dots, (X^*_{n2}, Y^*_{n2}) \sim BVN\left(\hat \mu_x, \hat \mu_y, \hat \sigma^2_x, \hat \sigma^2_y, \hat \rho\right) \rightarrow r^*_2$
    $\vdots$
    $(X^*_{1B}, Y^*_{1B}), (X^*_{2B}, Y^*_{2B}), \dots, (X^*_{nB}, Y^*_{nB}) \sim BVN\left(\hat \mu_x, \hat \mu_y, \hat \sigma^2_x, \hat \sigma^2_y, \hat \rho\right) \rightarrow r^*_B$

    BS estimate of the SE:

    $$
    se(r) = \sqrt \frac{\sum(r_i^*-\bar{r}^*)^2}{B-1};\ \ \bar{r} = \frac{1}{B}\sum^B_{i=1} r^*_i
    $$

    CI for $/rho$: $\left( r^*_{0.025}, r^*_{0.975}\right)$ Crude way of
    getting $95\%$ CI

Aside: textbook formula for estimating SE of $r$ (only an
approximation).

$$
\widehat {se}(r) = \frac{1-r^2}{\sqrt{n-3}}
$$ Its basis: The denominator of the result below resembles a se. $n-3$
is a finite sample correction (better way to estimate for small sample
size)

$$
\frac{r-\rho}{\frac{1-\rho}{\sqrt{n}}} \overset{d} \longrightarrow \mathcal N(0,1)
$$

Aim: compare approximation formula with the bootstrap estimate.

``` r
#setwd("C:/Users/mcluc/Desktop/PENDING/STAT 252/4_DATASETS")
admission <- read.csv('admission.csv',header=T)
Entrance <- admission[,1]; GPA <- admission[,2]
plot(GPA~Entrance,data=admission,pch=16)

# sample size: 20
mean(Entrance); mean(GPA) #5, 2.5
var(Entrance); var(GPA) # 0.48, 0.5179
cov(Entrance,GPA) # 0.4032
length(Entrance)

set.seed(100)
library(mvtnorm) #allows me to sample from multivariate normal
B=500 #number of bootstrap samples
r.star <- c()
for(b in 1:B){
  x <- rmvnorm(20,c(5,2.5),matrix(c(0.48,0.4032,0.4032,0.5179),nrow=2)) #sample from plug-in
  r.star[b] <- cor(x[,1],x[,2]) #bootstrap statistics
}
se.r.boot <- sd(r.star) #.0289
print(se.r.boot) #Bootstrap estimate of the std. err. of r
print(c(quantile(r.star,.025),quantile(r.star,.975))) #Boot. percentile 95% CI for \rho (.626, .92)


se.r.textbook <- (1-0.8086^2)/sqrt(20-3) 
print(se.r.textbook) #0.08396
```
