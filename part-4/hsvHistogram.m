function [sol] = hsvHistogram(path_to_image, count_bins)
  [h s v] = rgb_2_hsv2(path_to_image);
  range = [0:1.01/count_bins:1.01];
  
  sol_h = sum(histc(h, range)');
  sol_s = sum(histc(s, range)');
  sol_v = sum(histc(v, range)');
  
  sol = [sol_h(1:count_bins) sol_s(1:count_bins) sol_v(1:count_bins)];
  
end