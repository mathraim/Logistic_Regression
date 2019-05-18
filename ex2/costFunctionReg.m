function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta

J = (-1/m)*sum(y.*log(sigmoid(X*theta))+(ones(m,1)-y).* log(ones(m,1) - sigmoid(X*theta)))+ lambda*(theta(2)^2+theta(3)^2)/(2*m);
X_transpose = X';
grad = X_transpose*(sigmoid(X*theta)-y)/(m);
grad(2) = grad(2) + lambda*theta(2)/m;
grad(3) = grad(3) + lambda*theta(3)/m;



% =============================================================

end
