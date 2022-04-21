
% probability of surviving per gene
gen_probs = [0.2, 0.4, 0.6, 0.8];
% probability of having one step mutation or a two-step mutation
gen_probs_offspring = [0.80,0.90];
% number of offspring per individual
offspring_number = 4;
% Initialize population (default: 20 individuals at gen number 4)
[population] = initialize_population(20);
generation = 1;
while(1)
    if length(population) > 500
        population = population(1:ceil(length(population)/500):end);
    end
    death_counter = 0;
    %Status of the generation
    fprintf("Generation %d\n", generation)
    generation = generation + 1;
    final_population = [];
    fprintf("This is the actual population:\n");
    for i=1:length(population)
        %fprintf("%d",population(i))
        if rand()<gen_probs(population(i))
            final_population = [final_population, 0];
            death_counter = death_counter + 1;
        else
            final_population = [final_population population(i)];
        end
    end
    fprintf("\n")
    %Population deaths 
    fprintf("This is the population that died (0 means death):\n");
    i=1;
    a = 1;
    b = length(final_population);
    r = (b-a).*rand(20,1) + a; 
    if length(final_population) <= 20
        for i=1:length(final_population) 
            fprintf("%d",final_population(i));
        end
    else
        for i=1:20
            fprintf("%d", final_population(ceil(r(i))));
        end
    end

    fprintf("\n")
    
    %Population offspring
    offspring = [];
    for i=1:length(final_population)
        if final_population(i) ~= 0
            for j=1:offspring_number
                if rand()<gen_probs_offspring(1)
                    offspring = [offspring final_population(i)];
                elseif rand()<gen_probs_offspring(2) 
                    if final_population(i) == 4 
                        offspring = [offspring 3];
                    elseif final_population (i) == 1
                        offspring = [offspring 2];
                    elseif rand()<0.5
                        offspring = [offspring (final_population(i)-1)];
                    else
                         offspring = [offspring (final_population(i)+1)];
                    end
                else
                    if final_population(i) > 2 
                        offspring = [offspring (final_population(i)-2)];
                    elseif final_population (i) < 2
                        offspring = [offspring (final_population(i)+2)];
                    end

                end
            end
        end
    end
    
    fprintf("This is the offspring:\n")
    i=1;
    a = 1;
    b = length(offspring);
    r = (b-a).*rand(20,1) + a; 
    if length(offspring) <= 20
        for i=1:length(offspring) 
            fprintf("%d",offspring(i));
        end
    else
        for i=1:20
            fprintf("%d", offspring(ceil(r(i))));
        end
    end
    fprintf("\n")
    population = [];
    population = offspring;
    
    fprintf("Final percentages:\n");
    fprintf("Initial Population: %d\n", length(final_population));
    fprintf("Final Population: %d (a %.2f%c survived)\n", length(final_population) - death_counter, 100*(length(final_population) - death_counter)./length(final_population),'%'); 
    fprintf("Number of newborns: %d\n", length(offspring));
    fprintf("Newborns: White Butterflies: %.2f%c \n", 100*length(find(population == 4))./length(population), '%');
    fprintf("Newborns: White-Grey Butterflies: %.2f%c \n", 100*length(find(population == 3))./length(population), '%');
    fprintf("Newborns: Grey-White Butterflies: %.2f%c \n", 100*length(find(population == 2))./length(population), '%');
    fprintf("Newborns: Black Butterflies: %.2f%c \n", 100*length(find(population == 1))./length(population), '%');
    fprintf("\n\n")

   
    choice = menu('Do you want to continue?','Yes','No');
    if choice==2 || choice==0
       break;
    end
end
