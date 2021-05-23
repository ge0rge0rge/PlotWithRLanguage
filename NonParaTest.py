import numpy as np
from scipy.stats import binom
from numpy import random
from matplotlib import pyplot as plt
from scipy import stats

muRange = np.linspace(51,55,200)
n = 20
N = 10000
mu0 = 53.0
powerT, powerU = [], []
muActual=51

while muActual<55:
    rejectT, rejectU = 0, 0
    for i in range(N):
        data = random.normal(loc=muActual, scale=1.2, size=n)
        pValT=stats.ttest_1samp(data, mu0, axis=0).__getattribute__("pvalue")
        xPositive = len(data[data>mu0])
        uStat = max(xPositive, n-xPositive)
        pValSign = 2 * (1-binom.cdf(k=abs(uStat), n=n,p=0.5))
        rejectT += pValT < 0.05
        rejectU += pValSign < 0.05
    powerT.append(rejectT / N)
    powerU.append(rejectU / N)

    muActual+=0.02

plt.plot(muRange,powerT,color='b',label="t test")
plt.plot(muRange,powerU,color='r',label="Sign test")
plt.show()

