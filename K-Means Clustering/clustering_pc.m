function  [centroids assigns] = clustering_pc(points, NC)
  % Functie pentru algoritmul KMEANS.
  % Imi setez un numar maxim de iteratii pentru algoritm, numarul de puncte,
  % aleg random primii centroizi.
  maxSteps = 100;
  nrPoints = length(points(1,:));
  firstCenters = randperm(length(points(:,1)));
  centroids = points(firstCenters(1:NC), :); 
  
  % Imi creez un vector assigns care imi va retine in ce cluster se va afla
  % fiecare punct.
	assigns = [];
  
  
  % Parcurg toate punctele, imi setez o valoare minima ca fiind cel mai mare
  % numar real, apoi calculez distanta euclidiana dintre fiecare punct si
  % centroizi. Daca distanta e mai mica decat valoarea minima, atunci noua
  % valoare minima o sa fie distanta si punctul va apartine clusterului
  % de la iteratie curenta K.
  for i = 1 : maxSteps
		clusterPoints = zeros(NC, nrPoints);
		clusterSize = zeros(NC, 1);
		for j = 1 : length(points(:,1)) 
      minValue = realmax;
			clusterTo = 0;
			for k = 1 : NC 
        if norm(points(j,:) - centroids(k,:)) < minValue
					minValue = norm(points(j,:) - centroids(k,:));
					clusterTo = k;
				endif
			endfor
			assigns(j,1) = clusterTo;
      % Adun fiecare punctele ce apartin clusterului corespunzator si totodata
      % aflu si numarul de puncte din acel cluster. 
			clusterPoints(clusterTo, :) += points(j, :);
			++clusterSize(clusterTo);
		endfor
    
    % Calculez noii centroizi, daca distanta dintre centroizii vechi si cei noi
    % converge la 0, algoritmul se termina, altfel vechii centroizi devin cei 
    % noi si algoritmul continua.
		newcentroids =  [];
		for i = 1 : NC 
			newcentroids(i, :) = clusterPoints(i, : ) / clusterSize(i);
		endfor

		if norm(abs(newcentroids-centroids)) < eps
			break;
		endif
    
		centroids = newcentroids;
	endfor	
endfunction