function [x] = SST(A, b)

  [n m] = size(A);
  if (n > m)
    nou_dim = m;
    A = A(1:m,:);
  endif
  
  for i = nou_dim:-1:1
    sum = 0;
    for j = i + 1:nou_dim
      sum = sum + A(i, j)*x(j);
    endfor
    if A(i, i) != 0
      x(i) = (b(i) - sum) / A(i, i);
    endif
  endfor
  
end
