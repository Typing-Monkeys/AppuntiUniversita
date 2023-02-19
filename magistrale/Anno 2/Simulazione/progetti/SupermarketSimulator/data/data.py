# File for teoretical and observed distribution plotting
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from scipy.special import factorial

# Read observed data as |lower bound|upper bound|frequency|
df = pd.read_csv('data.csv')

# Distribution Parameters based on observed frequency
categories = np.arange(len(df['observed_frequency']))
n = np.sum(df['observed_frequency'])
mean = np.sum(categories * df['observed_frequency']) / n
variance = np.sum(np.power(categories - mean , 2) * df['observed_frequency']) / (n-1)
std_dev = np.sqrt(variance)
lambda_parameter = np.mean([mean,variance])

print(mean, variance, std_dev, lambda_parameter)

# Plot the observed frequency
bounds = [x1 for x1, _, _ in df.values]
f_i = np.arange(np.min(df['observed_frequency'])-1, np.max(df['observed_frequency'])+3, 1)
fig, ax = plt.subplots(figsize=(12, 6))

# Real Distribution parameters
categories_plot = np.arange(0, len(df['observed_frequency']), 0.1)
d = np.exp(-lambda_parameter) * np.power(lambda_parameter, categories_plot) / factorial(categories_plot)
d *= np.sum(df['observed_frequency'])

# Plot the Real Distribution
plt.bar(categories, df['observed_frequency'], align='edge', alpha=.9, label="Observed Frequency")
plt.xticks(categories, bounds)
plt.yticks(f_i)
a = plt.plot(categories_plot, d, c='r', label="Teoretical Poisson Distribution")
plt.ylabel('Frequency')
plt.xlabel('Time (15 min each interval)')
plt.title('Supermarket Arrivals')
plt.legend()

plt.savefig("data_distribution.png")