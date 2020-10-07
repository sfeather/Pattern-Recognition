function [percentage] = evaluate(path_to_testset, w, histogram, count_bins)
  k = strcmp(histogram, "RGB");
  if k == 1
%    [sol] = rgbHistogram(path_to_dataset, count_bins);
%pt pisici:
    path_to_cats = strcat(path_to_testset, "cats/");
    fis = dir(fullfile(path_to_cats, '*.jpg'));
    n = length(fis);
    for i = 1:n
      poza = fis(i).name;
      path_to_image = strcat(path_to_cats, poza);
      [sol] = rgbHistogram(path_to_image, count_bins);
      sol = [sol 1];
      y1(i) = w' * sol';
    endfor
    
%pt nepisici
    path_to_notcats = strcat(path_to_testset, "not_cats/");
    fis = dir(fullfile(path_to_notcats, '*.jpg'));
    m = length(fis);
    for i = 1:m
      poza = fis(i).name;
      path_to_image = strcat(path_to_notcats, poza);
      [sol] = rgbHistogram(path_to_image, count_bins);
      sol = [sol 1];
      y2(i) = w' * sol';
    endfor
    
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
      sol = [sol 1];
      y1(i) = w' * sol';
    endfor
    
%pt nepisici
    path_to_notcats = strcat(path_to_testset, "not_cats/");
    fis = dir(fullfile(path_to_notcats, '*.jpg'));
    m = length(fis);
    for i = 1:m
      poza = fis(i).name;
      path_to_image = strcat(path_to_notcats, poza);
      [sol] = hsvHistogram(path_to_image, count_bins);
      sol = [sol 1];
      y2(i) = w' * sol';
    endfor
    
    sum1 = sum(y1 >= 0);
    l1 = length(y1);
    sum2 = sum(y2 < 0);
    l2 = length(y2);
    percentage = (sum1 + sum2) / (l1 + l2);
  endif

endfunction