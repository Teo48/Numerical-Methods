function A_k = task1(image, k)
  A = double(imread(image));
  m = size(A, 1);
  n = size(A, 2);
  [U,S,V] = svd(A);
  
  U_k = U(1:m, 1:k);
  S_k = S(1:k, 1:k);
  V_k = V(1:n, 1:k);
  A_k = U_k*S_k*V_k';
end