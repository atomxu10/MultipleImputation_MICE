# Missing Data Experiment: Multiple Imputation with the MICE Algorithm ![Language](https://img.shields.io/badge/language-R-blue)

It is common to encounter data sets where some of the values are missing, for example, in a sample survey if a respondent does not answer all the questions, or if a process for recording data wasn’t working on a particular day. If we fit a linear model in R using these data, R will ignore any row with a missing value. This is sometimes referred to as a **Complete Case Analysis**.

**Multiple Imputation by Chained Equations (MICE)** is a sophisticated technique for handling missing data. Instead of filling in missing values with a single estimate, MICE creates multiple complete datasets by imputing missing values multiple times. Each dataset is then analyzed separately, and the results are combined to account for the uncertainty associated with the missing data.

The MICE algorithm works by iteratively imputing each missing value based on the other variables in the dataset. It uses a series of regression models to predict missing values, ensuring that the relationships between variables are preserved. This method provides more accurate and reliable results compared to single imputation methods (Mean Imputation, Median Imputation, Interpolation).

The objective of this project is to compare the effectiveness of two different approaches for handling missing data. All corresponding codes (R markdown) can be found in the [mice_markdown.Rmd](https://github.com/atomxu10/TimeSeriesProject/blob/main/tsp.Rmd).


## Content
- [Data](#1)
- [Model (Multiple Linear Regression)](#2)
- [Exploratory data analysis](#3)
- [Method](#4)
- [Convergence of the MICE algorithm](#5)
- [Results](#6)
- [Conclusion](#7)

## Data
SeoulBikeData ([databike.csv](https://github.com/atomxu10/MultipleImputation_MICE/blob/main/databike.csv)) is a dataset containing information about bike rentals in Seoul, South Korea. The dataset is provided by the Seoul Metropolitan Government, and there are 297 datasets in total, which can be used for data analysis and prediction.

The variables are :
- Rented Bike Count (RBC): The number of bikes rented per hour.
- Temperature (TEMP): The temperature in Celsius.
- Humidity (HUM): The relative humidity.
- Wind speed (WS): The wind speed in meters per second.
- Visibility (VIS): The visibility in meters.
- Dew point temperature (DP): The dew point temperature is Celsius.
- Solar radiation (SR): The solar radiation in MJ/m2.

All variables data types are continuous.

## Model (Multiple Linear Regression)
Multiple Linear Regression is a regression analysis method used to establish a linear relationship between multiple independent variables and a dependent variable, and all variables are numerical variables. In this case, all variable categories are continuous, so linear regression can be used to explain the relationship between variables, RBC is defined as an independent variable, and the others are dependent variables. The regression model can be represented as:

$$
\[ Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + \beta_3 X_{3i} + \beta_4 X_{4i} + \beta_5 X_{5i} + \beta_6 X_{6i} + \epsilon_i \]
$$
where \(\epsilon \sim N(0, \sigma^2)\)


