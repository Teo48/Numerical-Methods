function cost = compute_cost_pc(points, centroids)
	% Imi creez un matrice 3D in care stochez pe nivele punctele din fiecare
  % cluster. Nivelul 1 va contine toate punctele ce apartin clusterului 1,
  % nivelul 2 va continte toate punctele ce apartin clusterului 2 si tot asa.
  cost = 0;
  [centroids, assign] = clustering_pc(points, length(centroids(:,1)));
  nrClusters = length(centroids(:,1));
  pointsMatrix = [];
  for i = 1 : length(points(:,1))
    for j = 1 : nrClusters
      if (assign(i,:) == j)
        pointsMatrix(i,:,j) = points(i,:);
      endif
    endfor
  endfor
  
  % Imi creez un vector costs ce va contine costul fiecarui cluster.
  % Calculez pe fiecare nivel distanta de la fiecare punct la centroidul 
  % corespunzator si o adun la costs.
  costs = zeros(nrClusters,1);
  for i = 1 : nrClusters
    for j = 1 : length(points(:,1))
      if (pointsMatrix(j,:,i) == 0)
        continue;
      endif
      dist = norm(pointsMatrix(j,:,i) - centroids(i,:));
      costs(i,:) += dist;
    endfor
  endfor
  
  % Costul total va fi suma tuturor costurilor
  for i = 1 : nrClusters
    cost += costs(i,:);
  endfor
end