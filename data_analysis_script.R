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