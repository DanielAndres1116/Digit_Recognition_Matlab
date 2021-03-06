function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%

DELTA_2 = zeros(1, 10);
DELTA_3 = 0;

yk = 1:num_labels;
for i=1:m 
    a_1 = X(i, :);
    a_1 = [1 a_1];
    z_2 = Theta1*a_1';
    a_2 = sigmoid(z_2);
    a_2 = [1; a_2];
    z_3 = Theta2*a_2;
    a_3 = (sigmoid(z_3)); %1x5000
    y_k = (yk == y(i));
    J = J + (1/m)*(-y_k*log(a_3)-(1-y_k)*log(1-a_3));
    delta_3 = a_3 - y_k';
    delta_2 = (Theta2)'*delta_3.*[1; sigmoidGradient(z_2)];
    Theta2_grad = Theta2_grad + delta_3*(a_2)';
    Theta1_grad = Theta1_grad + delta_2(2:end, :)*(a_1);
    
%     TAMy_k = size(y_k)
%    TamSG_z2 = size(sigmoidGradient(z_2))
%     TAMa_1 = size(a_1)
%     TAMa_2 = size(a_2)
%     TAMa_3 = size(a_3)
%     TAMd_2 = size(delta_2)
%     TAMd_3 = size(delta_3)
%     DELTA_3 = DELTA_3 + (a_3)'*delta_3
        
    %SG = size(sigmoidGradient(z_2))
    %tam_z_2= size(z_2)
     
end
J = J + (lambda/(2*m))*((sumsqr(Theta1(:,2:input_layer_size+1))) + (sumsqr(Theta2(:,2:hidden_layer_size+1)))); 

   Theta1_grad = (1/m)*Theta1_grad + (lambda/m)*(Theta1);
   Theta2_grad = (1/m)*Theta2_grad + (lambda/m)*(Theta2);
    
    
%     TAM1_1 = size(Theta1_grad(:, 1:input_layer_size))
%     TAM2_2 = size(Theta2_grad(:, 1:hidden_layer_size))
%     TAM1 = size(Theta1(:, 1:input_layer_size))
%     TAM2 = size(Theta2(:, 1:hidden_layer_size))
%   %  input_layer_size
%   %  hidden_layer_size
%     TAMTheta1_grad = size(Theta1_grad)
%     TAMTheta2_grad = size(Theta2_grad)
    
% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
