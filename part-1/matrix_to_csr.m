function [values, colind, rowptr] = matrix_to_csr(A)
  [n n] = size(A);
  nz = 0;
  count = 0;
  for i = 1:n
    k = 0;
    for j = 1:n
      if A(i, j) ~= 0
        if k == 0
          count++;
          rowptr(count) = nz + 1;
        endif
        k++;
        nz++;
        colind(nz) = j;
        values(nz) = A(i, j);
      endif
    endfor
  endfor

  rowptr(n + 1) = nz + 1;

endfunction