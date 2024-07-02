
library(MASS)
probability_estimates <- replicate(n = 5000, calculate_norm_prob(num_per_set = 100))
quantile(probability_estimates, probs = c(0.025, 0.975)) # 2.5th and 97.5th percentile

truehist(probability_estimates)
abline(v = true_val, col = 7, lwd = 2)

