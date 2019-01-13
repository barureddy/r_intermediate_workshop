library(tidyverse)

# Reading in the Data
counts_raw <- read_delim("data/counts-raw.txt.gz", delim = "\t")

# Checking the dimension of our data
dim(counts_raw)

# Getting Summary of plos Comment Count
summary(counts_raw$plosCommentCount)

# Check summary of weeks since publication
weeks_since_pub <- counts_raw$daysSincePublished / 7
summary(weeks_since_pub)

# Plot a histogram of weeks since publication
hist(weeks_since_pub)

# Plot two features against each other
plot(counts_raw$daysSincePublished / 7 , counts_raw$wosCountThru2011)

#https://github.com/aabiddanda/r_intermediate_workshop



