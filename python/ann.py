import numpy as np

# sigmoid function
def nonlin(x,deriv=False):
    if(deriv):
        return x*(1-x)
    else:
        return 1/(1+np.exp(-x))
# input dataset
X = np.array([  [0,0,1],
[0,1,1],
[1,0,1],
[1,1,1] ])
# output dataset      
y = np.array([[0,0,1,1]]).T

# seed random numbers to make calculation
# deterministic (just a good practice)
np.random.seed(1)

# initialize weights randomly with mean 0
# the random number in range (-1, 1)
syn0 = 2*np.random.random((3,1)) - 1
for iter in xrange(10000):
    # forward propagation
    l0 = X
    l1 = nonlin(np.dot(l0,syn0))

    # how much did we miss?
    l1_error = y - l1

    # multiply how much we missed by the
    # slope of the sigmoid at the values in l1
    l1_delta = l1_error * nonlin(l1,True)
    '''
    print 'l1 = ', l1
    print 'nonlin(l1 = ', nonlin(l1,True)
    print 'l1_delta = ', l1_delta
    '''
    # update weights
    syn0 += np.dot(l0.T,l1_delta)
print "Output After Training:"
print l1

in1 = np.array([[0,0,1]])
out1 = nonlin(np.dot(in1,syn0))
