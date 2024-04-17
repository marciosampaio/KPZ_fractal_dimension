#!/usr/bin/python3.8
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns

"""
This script receive a data file with alpha as a function of time
Return: Difference between the fractal dimensions: delta

Author: Márcio S. Gomes-Filho (marcio@setubal.net.br)
"""

# Reading the values of alpha as a function of time
t, Alphavalues = np.loadtxt('alphat_4096_5_3.pdata', unpack=True, usecols=[0,1]) 

# Computing the fractal dimensions
df = 2.0 - Alphavalues
di = 1.0/Alphavalues -1.0

# Difference between the fractal dimensions: delta
delta = df - di
print(delta)

# Salving the data in outfile
DataOut=np.column_stack((t, delta))
np.savetxt('fractal.dat',  DataOut, fmt='%f %f',header="t delta")
