function [w] = learn(X, y, lr, epochs)
 %w primeste valori random din intervalul [-0.1, 0.1];
 [n m] = size(X);
 
 a = -0.1;
 b = 0.1;
 w = (b-a).*rand(1, m + 1) + a;
 
 for i = 1:m
   X(:,i) = (X(:,i) - mean(X(:,i))) / std(X(:,i));
 endfor
% X(:,1:m) = (X(:,1:m) - mean(X(:,1:m))) / std(X(:,1:m));
 
 X1 = [X ones(n,1)];
 
 for epoch = 1:epochs
   c = randperm(n, 64);
   Xb = X1(c,:);
   yb = y(c);
   for i = 1 : m + 1
     suma = 0;
%     for j = 1 : 64
%       suma = suma + (Xb(j,:) * w' - yb(j)) * Xb(j, i); 
%     endfor
     suma = sum((Xb(1:64,:) * w' - yb(1:64)) * Xb(1:64, i));
     w(i) = w(i) - lr * suma / n;
   endfor
 endfor
endfunction
