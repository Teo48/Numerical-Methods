function view_clusters(points, centroids)
  % Obtin numarul de clustere, precum si asignarea punctelor in clustere.
  % Imi creez o matrice de culori RANDOM in functie de numarul de clustere
  % Parcurg punctele si in functie de clusterul in care au fost asignate,
  % imi creez un vector ce retine culorile pentru fiecare(De ex: punctelor 
  % din primul cluster le atribui culoarea rosu sa zicem, celor din al doilea
  % albastru si tot asa.
  % La final realizez reprezentarea grafica a clusterlor.
  v = [];
  [centroids, assigns] = clustering_pc(points, length(centroids(:,1)));
  nrClusters = length(centroids(:,1));
  
  colors = [];
  for i = 1 : nrClusters
    colors(i,:) = rand(1,3);
  endfor

  for i = 1 : nrClusters
    for j = 1 : length(points(:,1))
      if (assigns(j) == i)
        v(j,:) = colors(i,:);
      endif
    endfor
  endfor

  scatter3(points(:,3), points(:,2), points(:,1), [], v, 'filled');
end