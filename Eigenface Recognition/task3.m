function [A_k S Z] = task3(image, k)
  A = double(imread(image));
  m = size(A, 1);
  n = size(A, 2);
  miu = [];
  
  %Fac media pe fiecare linie si o scad din fiecare element al liniei
  for i = 1 : m
    miu(i) = mean(A(i,:), 2);
    A(i,:) -= miu(i);
  endfor

  Z = A' / sqrt(n-1);
  [U,S,V] = svd(Z);
  W = V(1:m, 1:k);
  Y = W' * A;
  A_k = W*Y + miu';
endfunction