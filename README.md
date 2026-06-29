# Orskov-McDonald-Nonlinear-Curve-Fit-Model-for-R
This R script provides a flexible, user-friendly template for modeling in situ ruminal nutrient digestibility data using the classic Orskov and McDonald (1979) nonlinear model.

**A. Features**

**1. Customizable Time Points:**

Default incubation intervals are set to 0, 3, 6, 12, 24, 48, and 72 hours, but can be easily edited to match your experimental design.

**2. Parameter Estimation:** Automatically calculates potential degradability kinetics
:
a = Soluble or washable fraction
b = Insoluble but potentially degradable fraction
c = Degradation rate of fraction b (per hour)

**3. Effective Degradability (ED):** Computes ED values using an adjustable passage rate (k), which defaults to 0.05 and can be modified as needed.

**4. Data Visualization:** Generates a clean, publication-ready graph representing the nonlinear curve fit against your actual data points.

**B. Model Formula**

The script fits the standard kinetics equation: p = a + b(1 - e^{-ct})
Where p is the disappearance at time t.
