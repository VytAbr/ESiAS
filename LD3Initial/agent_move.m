% find target postion for agent
% Made by V.A. 2020-11-11
% Veliau padaryti, kaip atskira funckija/procesa su savo thread'u

%Agent has no logic, even moves out of bounds. It can die! Make him better
% check 4 position
Agoal = zeros(2,4);
Agoal(:,1) = [PreyLoc(1)+1; PreyLoc(2)];
Agoal(:,2) = [PreyLoc(1)-1; PreyLoc(2)];
Agoal(:,3) = [PreyLoc(1); PreyLoc(2)+1];
Agoal(:,4) = [PreyLoc(1); PreyLoc(2)-1];
for i=1:4
    %     euclidian distance to target location
    goal_score(i) = norm(Agoal(:,i) - This_agent);
    
end

% Agent choose target location where to go. Can improve here
[~, Atarget] = min(goal_score);
Agoal = Agoal(:,Atarget);

% Agent make a move towards a target
% Create agent logic for making a move to 'Agoal'
% e.g. NewLoc = This_agent(1)-1; %moves left
%      This_agent = NewLoc; % save new location
%     Your script goes here...
% % % EXAMPLE BEGIN% % %
moves = [1 2 3 4];
for i=1:4
    NewLoc = This_agent;
    % Random move, but need to make decision for new move
    newMove = moves(randi(length(moves)));
    % get new position
    switch newMove
        case 1 % Right
            NewLoc(1) = NewLoc(1)+1;
        case 2 % Left
            NewLoc(1) = NewLoc(1)-1;
        case 3 % Up
            NewLoc(2) = NewLoc(2)+1;
        case 4 % Down
            NewLoc(2) = NewLoc(2)-1;
    end
%     Makes a move to empty space
    if ~sum(prod(NewLoc == AgentsLoc))
        This_agent = NewLoc;
        break;
    end
    % removes unavailable move from the list
    moves = moves(moves~= newMove);
    %     if no more available moves are left - victory (for agents)
    if isempty(moves)
        disp('agent didnt move');
    end
    
    
end
% % % EXAMPLE END% % %





%    if agent is stupid, and moves out of bounds, he dies!
if This_agent(1) > SizeOfEnvironmet(2) || This_agent(1) < SizeOfEnvironmet(1) ...
        || This_agent(2) > SizeOfEnvironmet(4) || This_agent(2) < SizeOfEnvironmet(3)
    This_agent = [nan; nan];
    disp('ooops'); % need to improve death effect
end
