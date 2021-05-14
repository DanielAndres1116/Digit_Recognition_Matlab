# Digit_Recognition_Matlab
## Training a Neural Network in hand-written digit recognition

### Dataset Description
In the file ex3data1.mat there are 5000 training examples of 20 pixel by 20 pixel grayscale image of the digit. Each pixel is represented by a floating point number indicating the grayscale intensity at that location. The 20 by 20 grid of pixels is "unrolled" into a 400-dimensional vector. Each of these training examples becomes a single row in our data matrix X. This gives us a 5000 by 400 matrix X where every row is a training example for a handwritten digit image. 

The second part of the training set is a 5000-dimensional vector y that contains labels for the training set. To make more compatible with MATLAB indexing, where there is no zero index, we have mapped the digit zero the valie ten. Therefoe, a "0" digit is labeled as "10", while the digits "1" to "9" are labeled as "1" to "9" in their natural order.

### Description of Files .m's 

- ex4.m: here there are the clear steps to execute the complete program. This is the file that we have to execute and read to understand the step by step of all the process. Here was setup the parameter as the input layer size, the hidden layer size, and the num of labels of the Neural Network. Also here was loaded and visualized the data, was loaded the initial random weights and was called the functions for execute the cost function, also was implemented the regularization by calling the nnCostFunction of other .m file. At the end  was implemented the backpropagation, regularization, training, and prediction. 
- displayData.m: function to help visualize the dataset
- fmincg.m: function minimization routine
- sigmoid.m: Sigmoid function
- computeNumericalGradient.m: Numerically compute gradients
- checkNNGradients.m: Function to check the gradients
- debubInitializeWeights.m: Function for initializing weigths
- predict.m: Neural network prediction function
- sigmoidGradient.m: Compute the gradient of the sigmoid function
- randInitializeWeights.m: Randomly initialize weights 
- nnCostFunction.m: Neural network cost Function

### Objectives

This programming exercise was made for understand the step-by-step of the Neural Network Training. Its variables initialization, setting of parameters as weights by reducing the Cost Function and using the activation function and complementing it with the regularization. Finally, using the forward propagation and the backpropagation is possible create a Neural Network with a great performance in a task as the prediction of hand-written digits.

This is a good starting to understand what there is inside the libraries that we use in Python like TensorFlow where we can take advantages of the Nural Networks.

### Conclusions

Putting together and in a strategically way all the basic concepts of a Neural Network is possible arrive to a good predictions of complex images as hand-written digits. This was proved viewing the Set Accuracy. 

It would have been better separate the data between training set and testing set. This is a point to improve. But the training set accuracy was good and the rest of the program seems to have worked well. 

##### PD: This exercise was made thanks to the course of Andrew NG in coursera about Machine Learning in Octave/MATLAB
