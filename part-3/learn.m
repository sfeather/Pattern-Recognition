function [w] = learn(X, y)
  [n m] = size(X);
  % m + 1 = dim lui w;
  X1 = [X ones(n,1)];
  [Q R] = Householder(X1);
  % R * w = Q' * y
  b = Q' * y';
  A = R;
  [w] = SST(A, b);
  w = w';
end
