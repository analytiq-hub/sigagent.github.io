---
layout: post
title: "Torch MNIST number detection example - sendtex"
author:
- Andrei Radulescu-Banu
---
[Training Model - Deep Learning and Neural Networks with Python and Pytorch](https://www.youtube.com/watch?v=9j-_dOze4IM)

Example code for detecting numbers in MNIST dataset:
```python
#!/usr/bin/python

import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.optim as optim
import torchvision
from torchvision import transforms, datasets
import matplotlib.pyplot as plt

# Download and cache locally the MNIST datasets
train = datasets.MNIST("", train=True, download=True,
                       transform=transforms.Compose([transforms.ToTensor()]))
test = datasets.MNIST("", train=False, download=True,
                      transform=transforms.Compose([transforms.ToTensor()]))

# Create the train and test datasets
trainset = torch.utils.data.DataLoader(train, batch_size=10, shuffle=True)
testset = torch.utils.data.DataLoader(test, batch_size=10, shuffle=True)

# How does data look like? Comment out the print to find out.
# Question: is there a slicker way to refer to the 1st batch in the trainset,
# rather than a for loop with a break on 1st pass?
for data in trainset:
    #print(data)
    break

# Comment out to see shape of data, and to show image
X, y = data[0][0], data[1][0]
#print(data[0][0].shape)
#plt.imshow(data[0][0].view(28,28))
#plt.show()

# The neural net has four levels
class Net(nn.Module):
    def __init__(self):
        super().__init__()
        self.fc1 = nn.Linear(784, 64) # 784 = 28*28, must match image shape
        self.fc2 = nn.Linear(64, 64)
        self.fc3 = nn.Linear(64, 64)
        self.fc4 = nn.Linear(64, 10) # We are detecting the digits 0-9
    def forward(self, x):
        ''' Move-forward routine'''
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return F.log_softmax(x, dim=1)

# Instantiate the neural net
net = Net()

# Pass a random image through the net - comment out to print output
X = torch.rand(28,28)
X = X.view(-1, 28*28)
output = net(X)
#print (output)

# Create an Adam optimizer, with step 0.01
optimizer = optim.Adam(net.parameters(), lr=0.01)

# Do this many passes over the trainset
EPOCHS = 3

for epoch in range(EPOCHS):
    for data in trainset:
        # data is batch of 10 featuresets and labels
        X, y = data # X is batch of digit images, y is corresponding batch of digits
        net.zero_grad() # Clears the gradient
        output = net(X.view(-1, 28*28)) # Pass X batch through net
        loss = F.nll_loss(output, y) # Compute loss compared with expected output
        loss.backward() # Backpropagation
        optimizer.step() # Adjust weights
    print(loss)

# Tally how many correct answers in the testset
correct = 0
total = 0
with torch.no_grad():
    for data in testset:
        X, y = data
        output = net(X.view(-1, 784))
        for idx, i in enumerate(output):
            # argmax gives us index of max arg - should match expected digit
            if torch.argmax(i) == y[idx]:
                correct += 1
            total += 1

print("Accuracy: ", round(correct/total, 3))

# Comment in these lines to see, digit by digit, how some digits got detected
i = 3 # Image i in last testset batch 
plt.imshow(X[i].view(28,28)) # Display the image
plt.show()

# Show the detected image
print("Image {} detected {}".format(data[1][i], torch.argmax(net(X[i].view(-1,784))[0])))

```