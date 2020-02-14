function view_cost_vs_nc(file_points)
  % Citesc punctele din fisier si le salvez in matricea points.
  % Am vazut ca fisierele au in primele 5 randuri text, asa ca le escapez.
  points = dlmread(file_points,' ',5, 0);
  
  % Setez numarul de clustere la 10 asa cum mi se cere in enunt si imi creez
  % un o matrice 3D de centroizi(De ce 3D? Vreau sa tin minte centroizii pentru
  % fiecare cluster, adica, pentru NC = 1, voi avea pe nivelul 1 un singur punct,
  % pentru NC = 2, voi avea pe nivelul 2 doua puncte si tot asa.
  NC = 10;
  cost = zeros(NC, 1);
  for i = 1 : NC
    cost(i,:) = compute_cost_pc(points, clustering_pc(points, i));
  endfor
  
  v = [1 2 3 4 5 6 7 8 9 10];
  p = plot(v, cost, 'LineWidth', 2);
end