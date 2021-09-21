clearvars
% rand('state' ,0')
goal = 'eiti';
size_goal = size(goal,2);
zodynas = 'qwertyuiopasdfghjklzxcvbnm ';
random_generations = 3000000;
% approx. random guesses needed: 1/27 ^ 4
% size(inputs)^size(goal)

tic
for i=1:random_generations
    %     generuojam atsitikritai 4 skaicius, aibeje iki 'inputs'
    chosen_i = randi(size(zodynas,2),1,size_goal);
    %     palyginam juos su tikslu. Imam is zodyno, pagal sugeneruotus indeksus "chosen_i"
    match_i = strcmp(goal,zodynas(chosen_i));
    %     match condition. Look for next letter
    if match_i
        disp('good');
        break
    end
end
toc

% Tyrimui atlikti, galima skaiciuoti kiek kartu rado trumpesni sakini
% Tikslas palyginti paieskos laika, iteraciju skaiciu su jusu kurtu
% genetiniu algoritmu

%% Kodas, kuris kartoja virsuje esanti skript'a N kartu ir skaiciuoja vidutini laika

% repeat experiment 10-20 times. Calculate average time
IwantToGetAverageTime = 0;
if IwantToGetAverageTime
    
    repeatN = 10; % nustatom kiek kartu suksim cikla. Pagal pc resursus
    tic    
    for ir=1:repeatN
        
        for i=1:random_generations
            chosen_i = randi(size(zodynas,2),1,size_goal);
            match_i = strcmp(goal,zodynas(chosen_i));
            %     match condition. Look for next letter
            if match_i
                disp(['good' num2str(ir)]);
                break
            end
        end
        
    end
    disp(['Average time per run was ' num2str(toc/repeatN) ' seconds'])    
    
end

