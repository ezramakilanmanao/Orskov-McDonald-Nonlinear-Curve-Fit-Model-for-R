# ---------------------------------------------------------
# ØRSKOV & McDONALD (1979) IN SITU DIGESTIBILITY MODEL IN R
# ---------------------------------------------------------

# 1. Create the dataset
# Time (hours) and simulated Dry Matter Degradability (%)
in_situ_data <- data.frame(
  Time = c(0, 3, 6, 12, 24, 48, 72),
  Degradability = c(20.5, 26.8, 32.1, 42.4, 55.2, 64.7, 70.1) 
)

# View the raw data
print("Raw Data:")
print(in_situ_data)

# 2. Fit the non-linear model using nls()
# NOTE: nls() requires "starting estimates" (start) to begin its calculations.
# We will guess that a is around 15, b is around 50, and c is around 0.05.
orskov_model <- nls(Degradability ~ a + b * (1 - exp(-c * Time)), 
                    data = in_situ_data, 
                    start = list(a = 15, b = 50, c = 0.05))

# 3. View the results (Estimated parameters a, b, and c)
print("---------------------------------------------------")
print("MODEL RESULTS (Estimates for a, b, and c):")
summary(orskov_model)

# 4. Optional: Calculate Effective Degradability (ED)
# Assuming an estimated rumen outflow/passage rate (k) of 0.05 per hour (5%/hr)
k <- 0.05 
params <- coef(orskov_model)
a_est <- params["a"]
b_est <- params["b"]
c_est <- params["c"]

ED <- a_est + ((b_est * c_est) / (c_est + k))

print("---------------------------------------------------")
cat("Effective Degradability (ED) at k=0.05 is:", round(ED, 2), "%\n")

# 5. Optional: Plot the data and the fitted curve
plot(in_situ_data$Time, in_situ_data$Degradability, 
     main = "In Situ Degradability Curve (Ørskov Model)",
     xlab = "Time (hours)", 
     ylab = "Degradability (%)", 
     pch = 16, col = "blue")

# Add the predicted smooth curve
curve_times <- seq(0, 72, length.out = 100)
predicted_degradability <- predict(orskov_model, list(Time = curve_times))
lines(curve_times, predicted_degradability, col = "red", lwd = 2)











