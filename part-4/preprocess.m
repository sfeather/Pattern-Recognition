function [X, y] = preprocess(path_to_dataset, histogram, count_bins)
  k = strcmp(histogram, "RGB");
%	img = x(1, 1:d);
  X1 = zeros(1, 3*count_bins);
  X2 = zeros(1, 3*count_bins);
  if k == 1
    %histogram = RGB
%pt pisici:
    path_to_cats = strcat(path_to_dataset, "cats/");
    fis = dir(fullfile(path_to_cats, '*.jpg'));
    n = length(fis);
    for i = 1:n
      poza = fis(i).name;
      path_to_image = strcat(path_to_cats, poza);
      [sol] = rgbHistogram(path_to_image, count_bins);
      X1 = [X1; sol];
      y1(i) = 1;
    endfor
    X1 = X1(2:n + 1, :);
    
    path_to_notcats = strcat(path_to_dataset, "not_cats/");
    fis = dir(fullfile(path_to_notcats, '*.jpg'));
    m = length(fis);
    for i = 1:m
      poza = fis(i).name;
      path_to_image = strcat(path_to_notcats, poza);
      [sol] = rgbHistogram(path_to_image, count_bins);
      X2 = [X2; sol];
      y2(i) = -1;
    endfor
    X2 = X2(2:m + 1, :);
  else
    path_to_cats = strcat(path_to_dataset, "cats/");
    fis = dir(fullfile(path_to_cats, '*.jpg'));
    n = length(fis);
    for i = 1:n
      poza = fis(i).name;
      path_to_image = strcat(path_to_cats, poza);
      [sol] = hsvHistogram(path_to_image, count_bins);
      X1 = [X1; sol];
      y1(i) = 1;
    endfor
    X1 = X1(2:n + 1, :);
    
    path_to_notcats = strcat(path_to_dataset, "not_cats/");
    fis = dir(fullfile(path_to_notcats, '*.jpg'));
    m = length(fis);
    for i = 1:m
      poza = fis(i).name;
      path_to_image = strcat(path_to_notcats, poza);
      [sol] = hsvHistogram(path_to_image, count_bins);
      X2 = [X2; sol];
      y2(i) = -1;
    endfor
    X2 = X2(2:m + 1, :);
  endif
  
  y = [y1 y2];
  X = [X1; X2];
  
  
endfunction
