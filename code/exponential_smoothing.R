# Exponential Smoothing on Atlanta Temperatures
# ISYE 6501: Intro to Analytics Modeling @ Georgia Tech
# Author: Hamza Syed

# Load libraries
library(zoo)
library(ggplot2)

# --- Load Data ---
# Replace with the actual path to your temps.txt file
temps <- read.table("data/temps.txt")
temps <- unlist(temps)

# Create time series object (July–Oct daily highs, 20 years)
temps_ts <- ts(temps, frequency = 122)  # ~122 days per Jul–Oct

# --- Exponential Smoothing (Holt-Winters) ---
model <- HoltWinters(temps_ts, beta = FALSE, gamma = FALSE)

# Plot smoothed vs actual
png("results/smoothed_plot.png", width = 800, height = 600)
plot(model, main = "Exponential Smoothing of Atlanta Temperatures")
dev.off()

# --- Extract smoothed values ---
fitted_values <- model$fitted[,1]
write.csv(fitted_values, "results/smoothed_values.csv", row.names = FALSE)

# --- CUSUM Analysis ---
# Parameters (from your submission)
sd_val <- sd(temps_ts)
C <- 0.5 * sd_val
T <- 5 * sd_val

# CUSUM function
cusum <- numeric(length(temps_ts))
for (t in 2:length(temps_ts)) {
  cusum[t] <- max(0, cusum[t-1] + (mean(temps_ts) - temps_ts[t] - C))
}

# Save CUSUM plot
png("results/cusum_plot.png", width = 800, height = 600)
plot(cusum, type = "l", col = "blue", lwd = 2,
     main = "CUSUM Analysis on Atlanta Temperatures",
     xlab = "Time", ylab = "CUSUM Value")
dev.off()
