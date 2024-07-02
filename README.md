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
Y_i = \beta_0 + \beta_1 X_{1i} + \beta_2 X_{2i} + \beta_3 X_{3i} + \beta_4 X_{4i} + \beta_5 X_{5i} + \beta_6 X_{6i} + \epsilon_i
$$

where $\epsilon \sim N(0, \sigma^2)\$

In the above formula, $Y_i$ is the value of the independent variable RBC, $X_{1i}$. . . $X_{6i}$ represent the values of the dependent variables TEMP, HUM, WS, VIS, DPT, SR respectively, and $\beta_1$. . . $\beta_6$ represent the coefficients of each dependent variable.

## Exploratory data analysis
After modifying the dataset to have missing data (proportions of missing data = 0.05), it can be seen that 208 observations are complete, accounting for 70% of the total data (Figure 1). Each variable in the data set has missing values, among which the variable with the most missing values is SR (20), and the least is VIS (10). Among all observations with missing values, there are 72 observations with missing single variables, accounting for 80.9%. There are 16 observations with two variables missing and 1 observation with three variables missing.

The missing data are completely random, which belongs to the MCAR type of missing data mechanisms and the missing data is not affected by any other variables.

<div align="center">
    <img src="plot/mdp.png" width="200px" alt="Figure 1">
</div>

<p align="center">Figure 1: Missing data pattern of the dataset</p>

## Method
1. Fitting a benchmark model
   The full data set (without missing values) is fitted with a linear regression model to obtain the estimated values and standard errors of each parameter. The model does not need to consider multicollinearity. It is only used for subsequent comparative analysis.

2. Modifying the data set to have missing data

   A seed number should be set so that missing data is constant to compare multiple models. Modifying the full data set according to 0.05 proportions of missing data, and generating a new data set (208 complete observations in the modified data set).

3. Complete case analysis

   Complete case analysis is a linear regression fitting using the modified data directly. During linear regression in R, observations with missing values would be removed. In this case, 89 observations will be deleted.

4. Multiple imputation with the MICE algorithm
   Multiple imputation with the MICE algorithm is a technique for imputing missing data that involves generating multiple datasets by using regression models to estimate missing values. The MICE algorithm is widely used because it can handle different types of variables and missing data patterns. The methods “norm” and “pmm” in the MICE package will be used.

   - “norm” - Assuming the distribution of the data is a normal distribution and using the mean and variance to generate random values from that distribution.
   - “pmm” - Missing values are assumed to have similar characteristics to other data points. When selecting similar data points, the difference between these data points and the missing value is calculated, and the value of the closest data point is selected according to the size of the difference to fill the missing value.

By checking the convergence of the MICE algorithm after using different methods, we can get the number of imputations and iterations.












