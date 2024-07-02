# Missing Data Experiment: Multiple Imputation with the MICE Algorithm ![Language](https://img.shields.io/badge/language-R-blue)

It is common to encounter data sets where some of the values are missing, for example, in a sample survey if a respondent does not answer all the questions, or if a process for recording data wasn’t working on a particular day. If we fit a linear model in R using these data, R will ignore any row with a missing value. This is sometimes referred to as a **Complete Case Analysis**.

**Multiple Imputation by Chained Equations (MICE)** is a sophisticated technique for handling missing data. Instead of filling in missing values with a single estimate, MICE creates multiple complete datasets by imputing missing values multiple times. Each dataset is then analyzed separately, and the results are combined to account for the uncertainty associated with the missing data.

The MICE algorithm works by iteratively imputing each missing value based on the other variables in the dataset. It uses a series of regression models to predict missing values, ensuring that the relationships between variables are preserved. This method provides more accurate and reliable results compared to single imputation methods (Mean Imputation, Median Imputation, Interpolation).

The objective of this project is to compare the effectiveness of two different approaches for handling missing data. All corresponding codes (R markdown) can be found in the [mice_markdown.Rmd](https://github.com/atomxu10/MultipleImputation_MICE/blob/main/mice_markdown.Rmd)(https://github.com/atomxu10/TimeSeriesProject/blob/main/tsp.Rmd).


## Content
- [Data](#1)
- [Methodology](#2)
- [Data exploration (Daily data)](#3)
