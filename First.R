library(tidyverse)

#read in data
counts_raw <- read_delim("r_intermediate_workshop/data/counts-raw.txt.gz", delim = "\t")

dim(counts_raw)

summary(counts_raw$plosCommentCount)

weeks_since_pub <-counts_raw$daysSincePublished / 7

summary(weeks_since_pub)

hist(weeks_since_pub)

plot(counts_raw$daysSincePublished /7, counts_raw$wosCountThru2011)

