clearvars
tic
goal = 'eiti';
size_goal = size(goal,2);
inputs = 'qwertyuiopasdfghjklzxcvbnm ';
goal_n = 1;
best_result = 0;
random_generations = 3000;
% 1/27 ^ 4

for i=1:random_generations
    chosen_i = randi(size(inputs,2));
    match_i = strcmp(goal(goal_n),inputs(chosen_i));
    %     match condition. Look for next letter
    if match_i
        goal_n = goal_n + 1;
    else % pasunkinimas, jei nerado vienu bandymu pradeda is naujo
        if best_result < (goal_n - 1)
            best_result = goal_n - 1;
        end
        goal_n = 1;
    end
    
    %     stop condition, if all letters found
    if goal_n == size(goal,2)+1
        disp('found all your string, Sir');
        disp(['took me ' num2str(i) ' iterations']);
        break;
    end
    
end

if goal_n < size(goal,2)+1
    disp(['found ' num2str(best_result) ' matches'])
end
toc

% Tyrimui atlikti, galima skaiciuoti kiek kartu rado trumpesni sakini
% Tikslas palyginti paieskos laika, iteraciju skaiciu su jusu kurtu
% genetiniu algoritmu