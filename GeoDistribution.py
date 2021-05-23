from scipy import stats
import numpy as np
import matplotlib.pyplot as plt
import random

def roulette(p):
    x = 0
    while 1:
        x += 1
        if random.random() < p :
            return x


p = 18/37
N=1000000
X = []
Y = []
for x in np.linspace(1, 7, 7):
    X.append(x)
    #  Y.append((1-p)**(x-1)*p)
    Y.append(stats.geom.pmf(x, p))  # stats.

Y2 = [0,0,0,0,0,0,0]

for i in range(1,N,1):
    index=roulette(p)
    if index<8:
        Y2[index-1] += 1

print(Y2)

for i in range(0, 7, 1):
    print(Y[i])
    Y2[i] = Y[i]/100000
    print(Y[i])
print(Y2)

#plt.bar(X, Y, width=0.2,color="yellow",label='PMF')
plt.bar(X, Y2, width=0.5, color="blue", label='MC Estimate')
plt.xlabel("X")
plt.ylabel("Probability")
plt.show()
