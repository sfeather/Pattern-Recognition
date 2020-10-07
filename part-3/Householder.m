function [Q, R] = Householder(A)
  [n m] = size(A);
  mini = min(n - 1, m);

  I = eye(n);
  H = eye(n);
  
  for i = 1:mini
    a = A(i:n, i);
    %calculam vectorul householder
    sigma = norm(a);
    u(1:n, 1) = 0;
    u(i) = A(i, i) + sigma;
    u(i + 1:n) = A(i + 1:n, i);

    %calculam Hi
    Hi = I - 2 * (u * u') / (u' * u);
    
    %calculam A = Hi * A;
    A = Hi * A;

    %calculam H = Hi * H;
    H = H * Hi; 

  endfor
  
  Q = H;
  R = A;
    
endfunction
