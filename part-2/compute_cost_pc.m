function [cost] = compute_cost_pc(points, centroids)
  [n d] = size(points);
  [NC d] = size(centroids);
  cost = 0;
  count = zeros(1, NC);
  for i = 1:n
    dist = zeros(1, NC);
    for j = 1:NC
      dist(j) = sqrt((centroids(j, :) - points(i, :)) * ((centroids(j, :) - points(i, :))'));
    endfor
    [minimul indice] = min(dist);
    %punctul i este cel mai aproape de centroidul cu indicele "indice"
    cost = cost + minimul;
  endfor
endfunction

