function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  k = strcmp(histogram, "RGB");
  w = w';
  X1 = zeros(1, 3 * count_bins);
  X2 = zeros(1, 3 * count_bins);
  if k == 1
%pt pisici:

    path_to_cats = strcat(path_to_testset, "cats/");
    fis = dir(fullfile(path_to_cats, '*.jpg'));
    n = length(fis);
    for i = 1:n
      poza = fis(i).name;
      path_to_image = strcat(path_to_cats, poza);
      [sol] = rgbHistogram(path_to_image, count_bins);
      X1 = [X1; sol];
    endfor
    
    X1 = X1(2:n + 1, :);

%pt nepisici

    path_to_notcats = strcat(path_to_testset, "not_cats/");
    fis = dir(fullfile(path_to_notcats, '*.jpg'));
    m = length(fis);
    for i = 1:m
      poza = fis(i).name;
      path_to_image = strcat(path_to_notcats, poza);
      [sol] = rgbHistogram(path_to_image, count_bins);
      X2 = [X2; sol];
    endfor
    
    X2 = X2(2:m + 1, :);
    
    X = [X1; X2];
    
    [n1 m1] = size(X);
    for i = 1:m1
      X(:,i) = (X(:,i) - mean(X(:,i))) / std(X(:,i));
    endfor
    
    X = [X ones(n1, 1)];
    
    for i = 1:n1
      y(i) = X(i,:) * w;
    endfor
  
    y1 = y(1:n);
    y2 = y(n + 1: n1);
 
    sum1 = sum(y1 >= 0);
    l1 = length(y1);
    sum2 = sum(y2 < 0);
    l2 = length(y2);
    percentage = (sum1 + sum2) / (l1 + l2);
  else
%pt pisici:

    path_to_cats = strcat(path_to_testset, "cats/");
    fis = dir(fullfile(path_to_cats, '*.jpg'));
    n = length(fis);
    for i = 1:n
      poza = fis(i).name;
      path_to_image = strcat(path_to_cats, poza);
      [sol] = hsvHistogram(path_to_image, count_bins);
      X1 = [X1; sol];
    endfor
    
    X1 = X1(2:n + 1, :);

%pt nepisici

    path_to_notcats = strcat(path_to_testset, "not_cats/");
    fis = dir(fullfile(path_to_notcats, '*.jpg'));
    m = length(fis);
    for i = 1:m
      poza = fis(i).name;
      path_to_image = strcat(path_to_notcats, poza);
      [sol] = hsvHistogram(path_to_image, count_bins);
      X2 = [X2; sol];
    endfor
    
    X2 = X2(2:m + 1, :);
    
    X = [X1; X2];
    
    [n1 m1] = size(X);
    for i = 1:m1
      X(:,i) = (X(:,i) - mean(X(:,i))) / std(X(:,i));
    endfor
    
    X = [X ones(n1, 1)];
    
    for i = 1:n1
      y(i) = X(i,:) * w;
    endfor
  
    y1 = y(1:n);
    y2 = y(n + 1: n1);
 
    sum1 = sum(y1 >= 0);
    l1 = length(y1);
    sum2 = sum(y2 < 0);
    l2 = length(y2);
    percentage = (sum1 + sum2) / (l1 + l2);
    
  endif

endfunction