function [G_J, c_J] = Jacobi_factorization(A, b)
  L = A - triu(A);
  U = A - tril(A);
  P = -L - U;
  D = A - L - U;
  D_inv = inv(D);
  G_J = D_inv * P;
  
  c_J = D_inv * b;
  
endfunction
