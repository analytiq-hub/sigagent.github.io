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

train = datasets.MNIST("", train=True, download=True,
                       transform=transforms.Compose([transforms.ToTensor()]))
test = datasets.MNIST("", train=False, download=True,
                      transform=transforms.Compose([transforms.ToTensor()]))

trainset = torch.utils.data.DataLoader(train, batch_size=10, shuffle=True)
testset = torch.utils.data.DataLoader(test, batch_size=10, shuffle=True)

# How does data look like? Comment out the print
for data in trainset:
    #print(data)
    break

X, y = data[0][0], data[1][0]
#print(data[0][0].shape)
#plt.imshow(data[0][0].view(28,28))
#plt.show()

class Net(nn.Module):
    def __init__(self):
        super().__init__()
        self.fc1 = nn.Linear(784, 64) # 784 = 28*28
        self.fc2 = nn.Linear(64, 64)
        self.fc3 = nn.Linear(64, 64)
        self.fc4 = nn.Linear(64, 10)
    def forward(self, x):
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = F.relu(self.fc3(x))
        x = self.fc4(x)
        return F.log_softmax(x, dim=1)


net = Net()

X = torch.rand(28,28)
X = X.view(-1, 28*28)
output = net(X)
#print (output)

optimizer = optim.Adam(net.parameters(), lr=0.01)

EPOCHS = 3

for epoch in range(EPOCHS):
    for data in trainset:
        # data is batch of featuresets and labels
        X, y = data
        net.zero_grad()
        output = net(X.view(-1, 28*28))
        loss = F.nll_loss(output, y)
        loss.backward()
        optimizer.step()
    print(loss)

correct = 0
total = 0
with torch.no_grad():
    for data in testset:
        X, y = data
        output = net(X.view(-1, 784))
        for idx, i in enumerate(output):
            if torch.argmax(i) == y[idx]:
                correct += 1
            total += 1

print("Accuracy: ", round(correct/total, 3))

# Check whether image i is detected
i = 3
plt.imshow(X[i].view(28,28))
plt.show()
print("Image {} detected {}".format(data[1][i], torch.argmax(net(X[i].view(-1,784))[0])))

```