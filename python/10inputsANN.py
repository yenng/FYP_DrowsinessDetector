import numpy as np

# Create input and output
# This is the inputs for square
X = []
X.append(np.array([[1023,1023,1023,1023,1023,1023,1023,1023,1023,1023]]))
X.append(np.array([[0,510,510,510,510,510,510,510,510,0]]))
X.append(np.array([[0,0,252,252,252,252,252,252,0,0]]))
X.append(np.array([[0,0,0,120,120,120,120,0,0,0]]))
X.append(np.array([[0,0,0,0,48,48,0,0,0,0]]))
X.append(np.array([[0,1016,1016,1016,1016,1016,1016,1016,0,0]]))
X.append(np.array([[0,0,254,254,254,254,254,254,254,0]]))
X.append(np.array([[0,0,0,248,248,248,248,248,0,0]]))
X.append(np.array([[512,0,0,0,0,0,0,0,0,0]]))
X.append(np.array([[248,248,248,248,248,0,0,0,0,0]]))
x = np.array([[0,0,0,0,124,124,124,124,124,0]])
Y = []
Y.append(np.array([0,0,1]))
# sigmoid function
def sigmoid_prime(x):
    return x*(1-x)

def sigmoid(x):
    return 1/(1+np.exp(-x))

class NeuralNetwork:
    def __init__(self):
        self.weight = []
        # initialize weights with random number in range (-1, 1)
        # weight for hidden layer 
        w1 = 2*np.random.random((10,5)) - 1

        # weight for output later
        w2 = 2*np.random.random((5,3)) - 1
        self.weight.append(w1)
        self.weight.append(w2)

    def training(self, inputs, outputs, count = 100000):
        for l in range(count):
            # structure for ANN
            # input layer -> hidden layer
            out1 = sigmoid(np.dot(inputs,self.weight[0]))

            # hidden layer -> output layer
            out2 = sigmoid(np.dot(out1,self.weight[1]))

            # compare calculated output with expected output
            out2_error = outputs - out2
            out2_delta = out2_error * sigmoid_prime(out2)
            out1_delta = np.dot(out2_delta,self.weight[1].T) * sigmoid_prime(out1)
            self.weight[0] += np.dot(inputs.T,out1_delta)
            self.weight[1] += np.dot(out1.T,out2_delta)
            '''if (l == 50000 or l == 1):
                print w2
        print w2'''

    def predict(self,x):
        out = x
        for l in range(0,len(self.weight)):
            out = sigmoid(np.dot(out,self.weight[l]))
        output = []
        output.append(int(round(out[0][0])))
        output.append(int(round(out[0][1])))
        output.append(int(round(out[0][2])))
        if (output == [0,0,1]):
            print 'This is a square.'
        return output
                          
nn = NeuralNetwork()
for l in range(len(X)):
    nn.training(X[l],Y[0])
nn.predict(x)
