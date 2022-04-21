
%This script plots the actual percentage of butterflies of each color

X = categorical({'Blancas','Blancas-grises','Negras-grises','Negras'});
X = reordercats(X,{'Blancas','Blancas-grises','Negras-grises','Negras'});

white_population_percentage = 100*length(find(population == 4))./length(population);
white_grey_population_percentage = 100*length(find(population == 3))./length(population);
black_grey_population_percentage = 100*length(find(population == 2))./length(population);
black_population_percentage = 100*length(find(population == 1))./length(population);
Y = [white_population_percentage, white_grey_population_percentage, black_grey_population_percentage, black_population_percentage];

bar(X,Y)