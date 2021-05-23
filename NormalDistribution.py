# importing the library
import matplotlib.pyplot as plt
from scipy.misc import derivative
import scipy.stats as stats
import numpy as np

mean=0
sigma=1
# defining the function



def function(x):
#    return np.exp(-1 * ((x - mean) ** 2) / (2 * (sigma ** 2))) / (math.sqrt(2 * np.pi) * sigma)
    return stats.norm.pdf(x)

# calculating its derivative
def deriv(x):
    return derivative(function, x, dx=1e-6, n=1)

def deriv2(x):
    return derivative(function, x, dx=1e-6, n=2)


# defininf x-axis intervals
y = np.linspace(-6, 6)

# plotting the function
plt.plot(y, function(y), color='purple', label='Function')

# plotting its derivative
plt.plot(y, deriv(y), color='green', label='Derivative')

plt.plot(y, deriv2(y), color='yellow', label='2nd Derivative')

# formatting
plt.legend(loc='upper left')
plt.grid(True)
plt.show()
