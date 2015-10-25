## Sets working directory.
setwd("/Users/Zoheb2/dev/datasciencecoursera/statistical_inference_project")

## Load useful libraries. 
library(knitr)
library(ggplot2)
library(dplyr)

## Set lambda as required by the assignment. 
lambda <- 0.2

## Set number of simulations 
nosim <- 1000

## Set number of samples. 
n <- 40

## Ensure reproducability.
set.seed(234234)

## Run simulations
exponential_distributions <- matrix(rexp(nosim*n, rate=lambda),nosim,n)
exponential_means <- data.frame(means=apply(exponential_distributions, 1, mean))

## Calculate theoretical mean
theoretical_mean <- 1/lambda

## Calculate sample mean
sample_mean <- mean(exponential_means$means)

## Create a histogram.
hist(exponential_means$means, breaks=50,
     main="Distribution of exponential means",
     xlab = "means",
     ylab = "density")
abline(v=theoretical_mean,col="red")

## Calculate theoretical standard deviation and variance.
theoretical_sd <- (1/lambda)/sqrt(n)
theoretical_var <- theoretical_sd^2

## Calculate sample standard deviation and variance. 
sample_sd <- sd(exponential_means$means)
sample_var <- sample_sd^2

## Create plot comparing to normal distribution.
ggplot(data=exponential_means, aes(x=means)) + 
      geom_histogram(binwidth=0.1,aes(y=..density..),alpha=0.2) +
      stat_function(fun = dnorm, arg=list(mean = theoretical_mean, sd = theoretical_sd)
                    , col = "red") +
      geom_density(col="blue")
