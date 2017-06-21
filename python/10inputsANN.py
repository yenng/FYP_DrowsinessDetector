import numpy as np

# Create input and output
x = np.array([0,0,0,0,0,0,0,0,0,0])
y = np.array([0,0,0])

# sigmoid function
def nonlin(x,deriv=False):
    if(deriv):
        return x*(1-x)
    else:
        return 1/(1+np.exp(-x))

# initialize weights with random number in range (-1, 1)
# weight for hidden layer 
w1 = 2*np.random.random((10,5)) - 1

# weight for output later
w2 = 2*np.random.random((5,3)) - 1

# structure for ANN
# 
out_temp1 = nonlin(np.dot(x,w1))
