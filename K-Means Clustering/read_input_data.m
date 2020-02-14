function [NC points] = read_input_data(file_params, file_points)
	% Citesc punctele din fisier si le salvez in matricea points.
  % Am vazut ca fisierele au in primele 5 randuri text, asa ca le escapez.
  % Alternativ puteam folosi comanda load pentru a evita asta.
  % Ar fi aratat ceva de genul: points = load(file_points, '-ascii');
  NC = 0;
	points = [];
  
  NC = importdata(file_params);
  points = dlmread(file_points,' ',5, 0);
end