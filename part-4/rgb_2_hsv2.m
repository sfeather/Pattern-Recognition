function [h s v] = rgb_2_hsv2(path_to_image)
  A = imread(path_to_image);
  rp = double(A(:,:,1))/255;
  gp = double(A(:,:,2))/255;
  bp = double(A(:,:,3))/255;
  cmax(:,:) = max(max(rp(:,:),gp(:,:)),bp(:,:));
  cmin(:,:) = min(min(rp(:,:),gp(:,:)),bp(:,:));
  delta = cmax - cmin;

  s = delta ./ cmax;

  [row col] = find(~delta);
  ind = [row col];
  %indicii pentru care delta = 0
  [n m] = size(ind);
  if (n > 0 && m > 0)
    h(ind(:,1), ind(:, 2)) = 0;
  endif

  [n m] = size(rp);
  h = zeros(n, m);

  c1 = (cmax - rp == 0) & (delta != 0);
  h(c1) = 60 * mod ((gp(c1) - bp(c1)) ./ delta(c1), 6);
  
  c2 = (cmax - gp == 0) & (delta != 0);
  h(c2) = 60 * ((bp(c2) - rp(c2)) ./ delta(c2) + 2);

  c3 = (cmax - bp == 0) & (delta != 0);
  h(c3) = 60 * ((rp(c3) - gp(c3)) ./ delta(c3) + 4);

  h = h/360;

  %indicii pentru care cmax = 0;
  [row col] = find(~(cmax));
  indrp = [row col];
  [n1 m1] = size(indrp);
  if (n1 > 0 && m1 > 0)
    s(indrp(:,1), indrp(:,2)) = 0;
  endif

  v = cmax;

endfunction