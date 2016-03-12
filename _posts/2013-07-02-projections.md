---
layout: post
title: "Cohort component projection"
description: "A simple example using R and matrices"
category: demography
---


I present an example of a cohort component projection using a closed female population (Sweden 1993), taken from Preston et al.'s book (Demography 2001, page 125). I use R and basic matrix algebra to replicate their results. The advantage of this procedure is that allows to compute easily the *intrinsic growth rate* and *age-proportionate distribution* of the stable equivalent population. All we need is the population by age at time 0 (from a census), survivorship ratios (from a life table), and age-specific fertility rates. 

The data: 





{% highlight r %}
dat <- read.csv("sweden1993.csv", sep = ",", header = T)
attach(dat)
{% endhighlight %}



{% highlight text %}
##    age     Nf     Lf      f
## 1    0 293395 497487     NA
## 2    5 248369 497138     NA
## 3   10 240012 496901     NA
## 4   15 261346 496531 0.0120
## 5   20 285209 495902 0.0908
## 6   25 314388 495168 0.1499
## 7   30 281290 494213 0.1125
## 8   35 286923 492760 0.0441
## 9   40 304108 490447 0.0074
## 10  45 324946 486613 0.0003
## 11  50 247613 480665     NA
## 12  55 211351 471786     NA
## 13  60 215140 457852     NA
## 14  65 221764 436153     NA
## 15  70 223506 402775     NA
## 16  75 183654 350358     NA
## 17  80 141990 271512     NA
## 18  85 112424 291707     NA
{% endhighlight %}


As can be seen, the data have five-year-interval age groups, so each projection forward will involve 5 years. The steps are very simple: 

1. Project forward the population of each age group (estimation of people alive)
2. Calculate the number of births of each age group based on fertility rates, adjusting by mortality (estimation of children alive)
3. Create a Leslie matrix, and then multiple it by the population vector (population by age at time 0) 

### Survivorship ratios

We have to estimate life table survival ratios, that is, proportions of birth cohorts surviving from one age interval to the next in a **stationary population**. Basically, we are summarizing the mortality experience of different cohorts assuming stationarity. Because census statistics refer to age "last birthday" (rather than exact age), I estimate ratios using $L_x$ (average number of survivors in an age interval) instead of $l_x$. 

$$S_x = \frac{_5L_x}{_5L_{x-5}}$$

I compute the survival ratios using a loop in R. The estimation of the open-ended survival ratio is slightly different but still straightforward: 

$$\frac{T_{85}}{T_{80}}$$  


{% highlight r %}
Sf <- NA
for (i in 1:(length(Lf) - 1)) {
    Sf[i] <- Lf[i + 1]/Lf[i]
}

# open-ended survival ratio
Sf[length(Sf)] <- Lf[18]/(Lf[17] + Lf[18])
{% endhighlight %}



{% highlight text %}
##  [1] 0.999 1.000 0.999 0.999 0.999 0.998 0.997 0.995 0.992 0.988 0.982 0.970 0.953 0.923 0.870 0.775 0.518
{% endhighlight %}

### Number of children

This is the tricky part. Because census statistics refer to age "last birthday", and we are projecting every 5 years, the estimation of the number of person-years lived by women in each age group consists of the average number of women alive at the beginning and end of the period (assuming a linear change over the period). To take advantage of the Leslie matrix, I define the births in R using a loop as follows: 


{% highlight r %}
Bf <- rep(0, 18)
for (i in 1:length(Lf)) {
    Bf[i] <- 1/(1 + 1.05) * Lf[1]/(100000 * 2) * sum(f[i + 1] * Sf[i], f[i], na.rm = TRUE)
}
{% endhighlight %}



{% highlight text %}
##  [1] 0.000000 0.000000 0.014550 0.124596 0.291792 0.318128 0.189858 0.062447 0.009340 0.000364 0.000000 0.000000
## [13] 0.000000 0.000000 0.000000 0.000000 0.000000 0.000000
{% endhighlight %}


1/(1+1.05) corresponds to a transformation of age-specific fertility rates (son and daughters) to maternity rates (only daughters), assuming that the ratio of male to female births (SBR) is constant across mothers' ages. The number of births is also adjusted by the corresponding survival ratio from 0 to 5 years old ($\frac{_5L_0}{5 \times l_0}$), the number 5 goes away due to simplifying).

### Leslie matrix

I construct a Leslie matrix by replacing specific cells of a 18 x 18 matrix (18 age groups) by the vectors defined above (survival ratios and maternity rates):


{% highlight r %}
m <- matrix(0, 18, 18)
m[1, ] <- Bf
s <- diag(17) * Sf
m[2:18, 1:17] <- s
m[18, 18] <- Sf[17]
{% endhighlight %}


Here we have the Leslie matrix:


{% highlight text %}
##        [,1] [,2]   [,3]  [,4]  [,5]  [,6]  [,7]   [,8]    [,9]    [,10] [,11] [,12] [,13] [,14] [,15] [,16] [,17] [,18]
##  [1,] 0.000    0 0.0145 0.125 0.292 0.318 0.190 0.0624 0.00934 0.000364 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
##  [2,] 0.999    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
##  [3,] 0.000    1 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
##  [4,] 0.000    0 0.9993 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
##  [5,] 0.000    0 0.0000 0.999 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
##  [6,] 0.000    0 0.0000 0.000 0.999 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
##  [7,] 0.000    0 0.0000 0.000 0.000 0.998 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
##  [8,] 0.000    0 0.0000 0.000 0.000 0.000 0.997 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
##  [9,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.9953 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
## [10,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.99218 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
## [11,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.987777 0.000  0.00 0.000 0.000  0.00 0.000 0.000 0.000
## [12,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.982  0.00 0.000 0.000  0.00 0.000 0.000 0.000
## [13,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.97 0.000 0.000  0.00 0.000 0.000 0.000
## [14,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.953 0.000  0.00 0.000 0.000 0.000
## [15,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.923  0.00 0.000 0.000 0.000
## [16,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.87 0.000 0.000 0.000
## [17,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.775 0.000 0.000
## [18,] 0.000    0 0.0000 0.000 0.000 0.000 0.000 0.0000 0.00000 0.000000 0.000  0.00 0.000 0.000  0.00 0.000 0.518 0.518
{% endhighlight %}


Note that the last survival ratio is repeated in the last column (0.518). This is because the estimation of the open-ended survival ratio is:

$$ (N_{80} + N_{85}) \times \frac{T_{85}}{T_{80}} $$

### Now, let's do some projections

Using the R multiplication operator for matrices, I do a 5-year projection  by simply multiplying the Leslie matrix by the population vector (remember that matrix multiplication is not commutative).


{% highlight r %}
m %*% Nf
{% endhighlight %}



{% highlight text %}
##         [,1]
##  [1,] 293574
##  [2,] 293189
##  [3,] 248251
##  [4,] 239833
##  [5,] 261015
##  [6,] 284787
##  [7,] 313782
##  [8,] 280463
##  [9,] 285576
## [10,] 301731
## [11,] 320974
## [12,] 243039
## [13,] 205109
## [14,] 204944
## [15,] 204793
## [16,] 194419
## [17,] 142324
## [18,] 131768
{% endhighlight %}


I obtain the same results of the book. Raising this multiplication I can get the projected population of subsequent periods. Because R doesn't have a power operator for matrices, I define a function called *mp* to raise matrices (it is not very efficient, but for this example it's still useful).


{% highlight r %}
mp <- function(mat, pow) {
    ans <- mat
    for (i in 1:(pow - 1)) {
        ans <- mat %*% ans
    }
    return(ans)
}
{% endhighlight %}


Let's project the initial population for two periods (10 years): 


{% highlight r %}
(mp(m, 2) %*% Nf)
{% endhighlight %}



{% highlight text %}
##         [,1]
##  [1,] 280121
##  [2,] 293368
##  [3,] 293049
##  [4,] 248066
##  [5,] 239529
##  [6,] 260629
##  [7,] 284238
##  [8,] 312859
##  [9,] 279147
## [10,] 283344
## [11,] 298043
## [12,] 315045
## [13,] 235861
## [14,] 195388
## [15,] 189260
## [16,] 178141
## [17,] 150666
## [18,] 141960
{% endhighlight %}


Again, I get the same result of the book. The nice thing of all this is that estimating eigenvalues and eigenvectors, I can obtain the intrinsic growth rate and age-distribution of the "stable equivalent" population. Using the *eigen* function in R, I can identify the dominant eigenvalue (higher absolute number), and the corresponding eigenvector: 


{% highlight r %}
e <- eigen(m)

# intrinsic growth rate
(max(abs(e$values)) - 1)/5  # 5-year-projection
{% endhighlight %}



{% highlight text %}
## [1] 0.000223
{% endhighlight %}



{% highlight r %}

# intrinsic proportionate age distribution
as.numeric(e$vector[, 1]/sum(e$vector[, 1]))
{% endhighlight %}



{% highlight text %}
##  [1] 0.0619 0.0618 0.0617 0.0616 0.0614 0.0613 0.0611 0.0608 0.0605 0.0600 0.0592 0.0580 0.0562 0.0535 0.0494 0.0429
## [17] 0.0332 0.0356
{% endhighlight %}


The population is growing but little. 

### What about the population momentum?

The population momentum corresponds to the growth of a population after imposing replacement fertility conditions, that is, NRR=1. Thus, the first thing we have to do is to estimate NRR. 


{% highlight r %}
# calculating NRR
(NRR <- sum(f * Lf/100000 * (1/(1 + 1.05)), na.rm = TRUE))
{% endhighlight %}



{% highlight text %}
## [1] 1.01
{% endhighlight %}

We can quickly estimate the intrinsic growth rate using NRR: 


{% highlight r %}
# quick estimation of the intrinsic growth rate
log(NRR)/27
{% endhighlight %}



{% highlight text %}
## [1] 0.000237
{% endhighlight %}


Very close to our estimation using cohort component projection. To impose the replacement condition, I just have to divide the first row of the Leslie matrix by NRR.


{% highlight r %}
m[1, ] <- m[1, ]/NRR
{% endhighlight %}


To get the population momentum we have to project the initial population until the growth is zero (here I raised the matrix 100 times), and then to compute the ratio between the initial population and the non-growing population (stationary). 



{% highlight r %}
# population momentum
sum(mp(m, 100) %*% Nf)/sum(Nf)
{% endhighlight %}



{% highlight text %}
## [1] 1.01
{% endhighlight %}


After imposing the replacement condition, the population grew 1%.
