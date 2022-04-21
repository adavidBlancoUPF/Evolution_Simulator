function [population] = initialize_population(number, gene_value)
%INITIALIZE_POPULATION creates a population of individuals in the
%ecosystem. It works with two parameters: 

%number: the number of individuals 
%gene_value: the value of their starting gene. 

%returns:
%population: 

%if no parameters creates by default a population of 20 individuals with a
%gene_value of 4
if nargin == 0
    number = 20;
    gene_value = 4;
else
    if nargin == 1
        gene_value = 4;
    end
end

for i=1:number
    population(i) = gene_value;
end


end

