function [x] = Jacobi_sparse(G_values, G_colind, G_rowptr, c, tol)
  n = length(c);
  x0 = zeros(n, 1);
  
  y = csr_multiplication(G_values, G_colind, G_rowptr, x0);
  x = y + c;
  
  while (norm(x - x0) >= tol)
    y = csr_multiplication(G_values, G_colind, G_rowptr, x);
    x0 = x;
    x = y + c;
  endwhile

endfunction