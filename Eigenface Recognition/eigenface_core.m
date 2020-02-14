function [m A eigenfaces pr_img] = eigenface_core(database_path)
  T = [];
  for i = 1 : 10
    image_matrix = double(rgb2gray(imread(strcat(database_path,'/',int2str(i),'.jpg'))));
    T = [T reshape(image_matrix, size((image_matrix),1) * size((image_matrix),2), 1)];
  endfor
  
  m = mean(T,2);
  A = T - m;
 
  [V D] = eig(A' * A);
  JUNK = [];
  for i = 1 : size(V,2) 
    if( D(i,i) > 1 )
      JUNK = [JUNK V(:,i)];
    endif
  endfor

  eigenfaces = A * JUNK;
  pr_img = [];
  for i = 1 : 10
    pr_img = [pr_img eigenfaces' * A(:,i)];
  endfor
end