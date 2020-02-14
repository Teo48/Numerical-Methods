function task5(image, k)
  A = double(imread(image));
  A_aux = A;
  m = size(A, 1);
  n = size(A, 2);
  [A_k S Z] = task3(image, k);
  
  %Cerinta 5.1
  y = diag(S);
  x = 1 : k;
  figure(1);
  plot(x, y(1:k), 'Linewidth', 2);
  
  %Cerinta 5.2 
  Z = A' / sqrt(n-1);
  [U,S,V] = svd(Z);
  
  suma_k = 0;
  v_suma_k = zeros(1, k);
  for i = 1 : k
    suma_k += S(i,i);
    v_suma_k(1, i) = suma_k;
  endfor
  
  v_suma_min = sum(diag(S));
  information = [];
  information = v_suma_k / v_suma_min;
  
  figure(2);
  plot(x, information, 'Linewidth', 2);  
  
  %Cerinta 5.3
  aprox_err = [];
  for i = 1 : k 
    [Ak] = task3(image, i);
    aux = (A_aux - Ak).^2;
    aprox_err(i) = sum(aux(:)) / (m * n);
  endfor
  
  figure(3);
  plot(x, aprox_err, 'Linewidth', 2);

  %Cerinta 5.4
  figure(4);
  compress_ratio = [];
  
  for i = 1 : k
    compress_ratio(i) = (2 * i + 1) / n;
  endfor 
   
  plot(x, compress_ratio, 'Linewidth', 2);
  end