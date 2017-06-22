import numpy as np

# Create input and output
x = np.array([0,0,0,0,0,0,0,0,0,0])
y = np.array([0,0,0])

# sigmoid function
def sigmoid_prime(x):
    return x*(1-x)

def sigmoid(x):
    return 1/(1+np.exp(-x))

# initialize weights with random number in range (-1, 1)
# weight for hidden layer 
w1 = 2*np.random.random((10,5)) - 1

# weight for output later
w2 = 2*np.random.random((5,3)) - 1

# structure for ANN
# input layer -> hidden layer
out1 = sigmoid(np.dot(x,w1))

# hidden layer -> output layer
out2 = sigmoid(np.dot(out1,w2))

# compare calculated output with expected output
out2_error = y - out2
out2_delta = out2_error * sigmoid_prime(out2)
