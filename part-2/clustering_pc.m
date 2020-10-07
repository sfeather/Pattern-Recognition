function [centroids] = clustering_pc(points, NC)
  [n d] = size(points);
  %d dimensiuni
  for i = 1:NC
    k = 0;
    for j = 0:NC:n
      if (j + NC <= n)
        k++;
        vect(k, :, i) = points(i + j, :);
      endif
    endfor
    
    for m = 1:d
      centroids(i, m) = sum(vect(:,m,i)) / k;
    endfor
  endfor
  
  list = zeros(NC, d);
  while(norm(list - centroids) >= 0.00001)
   
   dist = zeros(1, NC);
  
%    for i = 1:NC
%      list(i, :) = centroids(i, :);
%    endfor
    list = centroids;
    
    count = zeros(1, NC);
    for i = 1:n
      dist = zeros(1, NC);
      for j = 1:NC
        dist(j) = sqrt((centroids(j, :) - points(i, :)) * ((centroids(j, :) - points(i, :))'));
      endfor
      [minimul indice] = min(dist);
      %punctul i este cel mai aproape de centroidul cu indicele "indice"
      count(indice)++;
      for k = 1:d
        new_vect(count(indice), k, indice) = points(i, k);
      endfor
    endfor
    
    for i = 1:NC
      for m = 1:d
        centroids(i, m) = sum(new_vect(1:count(i),m,i)) / count(i);
      endfor
    endfor
    
  endwhile

endfunction
