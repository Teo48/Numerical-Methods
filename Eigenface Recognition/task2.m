function task2(image, k)
  A=double(imread(image));
  m = size(A, 1);
  n = size(A, 2);
  A_k = task1(image, k);
  [U_k,S_k,V_k] = svd(A_k);
  [U,S,V] = svd(A);
  
  %Cerinta 2.1
  y = diag(S_k);
  x = 1:k;
  figure(1);
  plot(x, y(1:k), 'Linewidth', 2);
  
  %Cerinta 2.2
  suma_k = 0;
  v_suma_k = zeros(1, k);
  for i = 1 : k
    suma_k += S_k(i,i);
    v_suma_k(1, i) = suma_k;
  endfor
  
  v_suma_min = sum(diag(S));
  information = [];
  information = v_suma_k / v_suma_min;
  
  figure(2);
  plot(x, information, 'Linewidth', 2);

  %Cerinta 2.3
  
  aprox_err = [];
  for i = 1 : k
    Ak = task1(image,i);
    aux = (A - Ak).^2;
    s = sum(aux(:));
    aprox_err(i) = s / (m * n);
  endfor
  figure(3);
  plot(x, aprox_err, 'Linewidth', 2);
  
  %Cerinta 2.4
  figure(4);
  compress_ratio = [];
  for i = 1 : k
    compress_ratio(i) = (m * i + n * i + i) / (m * n);
  endfor 
  plot(x, compress_ratio, 'Linewidth', 2);
end