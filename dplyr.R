---
title: "Dplyr"
author: "Bharat Reddy"
date: "January 13, 2019"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

#Subset rows and filter columns

What should we do first when we open a new markdown

Load Libraries
```{r}
library(dplyr)
library(tidyverse)
```
Load Data
```{r}
counts_raw <- read_delim("data/counts-raw.txt.gz", delim="\t") 
```

Goals:
subset rows of a dataframe and select columns of a data frame

```{r}
research <- filter(counts_raw, articleType=="Research Article")


```

Filter to research articles to 2006
```{r}
research_2006 <-  filter(research, year=="2006")

```

Filter to articles with a tweet
```{r}
research_2006_tweet <- filter(research_2006, backtweetsCount>0)
nrow(research_2006_tweet)


```
Research articles in 2006 and facebook

```{r}
research_2006_fb <- filter(research, year==2006, facebookCommentCount>0)

nrow(research_2006_fb)
```

Use logical operators
and &
or |

Look for research in 2006 with a tweet or facebook comment

```{r}
research_2006_fb_tweet <- filter(research, year==2006, facebookCommentCount>0 | backtweetsCount>0)
nrow(research_2006_fb_tweet)
```
Article in 2006 with social media coverage and is about infectious diseases
```{r}
research_2006_fb_tweet_disease <- filter(research, year==2006, facebookCommentCount>0 | backtweetsCount>0, grepl("Infectious Diseases", plosSubjectTags))
nrow(research_2006_fb_tweet_disease)
```
Subset columns of a dataframe with function subset
```{r}
colnames(research)
```
Subset the columns with the article information using the dplyr function select()

```{r}
article_info <- select(research, doi, pubDate, journal, title, articleType, authorsCount)
colnames(article_info)
```

New dataframe with columns doi:authorsCount
```{r}
article_info <- select(research, doi:authorsCount)
colnames(article_info)
```

create a metrics dataframe
```{r}
metrics <- select(research, contains("Count"))
colnames(metrics)
```
Exclude a column after contains
```{r}
metrics <- select(research, contains("Count"), -authorsCount)
colnames(metrics)
```
```{r}
metrics <- select(research, contains("Count"), -authorsCount, f1000Factor, wikipediaCites)
colnames(metrics)
```

Journal Column

```{r}
head(select(research, journal))

```

```{r}
head(select(research,3))
```
Slice: Slicing only the rows we want by numbers
Rows 1:3 article info dataframe
```{r}
slice(article_info, 1:3)
```

Reasearch before 2009
```{r}
research_before_2009 <- filter(research, year<2009)
research_before_2009_pdf <- filter(research, year<2009, pdfDownloadsCount>1000)
research_before_2009_pdf_men <- filter(research, year<2009, pdfDownloadsCount>1000, mendeleyReadersCount>15)
low_cite <- filter(research, year<2009, pdfDownloadsCount>1000, mendeleyReadersCount>15, wosCountThru2011<10)
nrow(low_cite)

```

#Channing commands with dplyr
In dplyer we use %>%

