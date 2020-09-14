clearvars
tic
% rand('state' ,0')
goal = 'eiti';
size_goal = size(goal,2);
inputs = 'qwertyuiopasdfghjklzxcvbnm ';
random_generations = 3000000;
% approx. random guesses needed: 1/27 ^ 4
% size(inputs)^size(goal) 

for i=1:random_generations
    chosen_i = randi(size(inputs,2),1,size_goal);
    match_i = strcmp(goal,inputs(chosen_i));
    %     match condition. Look for next letter
    if match_i
        disp('good');
        break
    end
    
end

% if goal_n < size(goal,2)+1
%     disp(['found ' num2str(best_result) ' matches'])
% end
toc

% Tyrimui atlikti, galima skaiciuoti kiek kartu rado trumpesni sakini
% Tikslas palyginti paieskos laika, iteraciju skaiciu su jusu kurtu
% genetiniu algoritmu