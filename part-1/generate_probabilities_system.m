function [A, b] = generate_probabilities_system(rows)
  %returneaza sistemul de ecuatii reprezentat de matricea A
  %si de vectorul b
  nodes = 0;
  for i = 1:rows
    nodes = nodes + i;
  endfor
  
  A = zeros(nodes);
  b = zeros([1 nodes]);
  vectNoduri = zeros([1 nodes]);
  b(nodes:-1:nodes - rows + 1) = 1;
 
  vectNoduri(1) = 4;
  vectNoduri(nodes) = 4;
  vectNoduri(nodes - rows + 1) = 4;
  
  k = 2;
  i = 2;
  while (i <= nodes - 2*rows + 2)
    vectNoduri(i) = 5;
    A(i, i + k) = A(i + k, i) = -1;  
    l = k + 2;
    j = i + k + 1;
    while (j <= nodes - rows - 1)
      vectNoduri(j) = 6;
      A(j, j + l) = A(j + l, j) = A(j, j - l + 1) = A(j - l + 1, j) = -1;
      A(j, j + l - 1) = A(j + l - 1, j) = A(j - l + 2, j) = A(j, j - l + 2) = -1;
      A(j, j + 1) = A(j + 1, j) = A(j - 1, j) = A(j, j - 1) = -1;
      j = j + l;
      l++;
    endwhile
    A(i, i + k + 1) = A(i + k + 1, i) = -1;
    i = i + k;
    k++;
  endwhile
  
  k = 3;
  i = 3;
  while (i <= nodes - rows)
    vectNoduri(i) = 5;
    A(i, i + k) = A(i + k, i) = -1;
    A(i, i + k - 1) = A(i + k - 1, i) = -1;
    i = i + k;
    k++;
  endwhile
  
  for i = nodes - rows + 2:nodes - 1
    vectNoduri(i) = 5;
    A(i, i + 1) =  A(i + 1, i) = A(i, i - 1) = A(i - 1, i) = -1;
  endfor
  
  vectNoduri(nodes) = 4;
  vectNoduri(nodes - rows + 1) = 4;

  A(1,2) = A(2,1) = A(3, 1) = A(1, 3) = A(3, 2) = A(2, 3) = -1;
  for i = 1:nodes
    A(i,i) = vectNoduri(i);
  endfor
  
  b = b';

endfunction