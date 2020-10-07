function [sol] = rgbHistogram(path_to_image, count_bins)
  %count_bins = numarul de valori pentru axa orizontala a histogramei
  %sol = vector linie de lungime count_bins*3 care repr hist RGB pozei
  A = imread(path_to_image);
  
  range = [0:256/count_bins:256];
  sol_r = sum(histc(A(:,:,1), range)');
  sol_g = sum(histc(A(:,:,2), range)');
  sol_b = sum(histc(A(:,:,3), range)');
  
  sol = [sol_r(1:count_bins) sol_g(1:count_bins) sol_b(1:count_bins)];
  
end