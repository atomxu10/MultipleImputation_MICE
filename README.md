# Missing Data Experiment: Multiple Imputation with the MICE Algorithm ![Language](https://img.shields.io/badge/language-R-blue)

It is common to encounter data sets where some of the values are missing, for example, in a sample survey if a respondent does not answer all the questions, or if a process for recording data wasn’t working on a particular day. If we fit a linear model in R using these data, R will ignore any row with a missing value. This is sometimes referred to as a complete case analysis.
