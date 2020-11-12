% Made by V.A. 2020-11-11
% Veliau padaryti, kaip atskira funckija/procesa su savo thread'u

% Moving Right=1 % Left=2 % Up=3 % Down=4
% prey moves randomly
NewLoc = PreyLoc;
% random move
%
moves = [1 2 3 4];
for i=1:4
    NewLoc = PreyLoc;
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
    % check new position for enviromental bounds (can be single if)
    if NewLoc(1) <= SizeOfEnvironmet(2) && NewLoc(1) >= SizeOfEnvironmet(1)
        if NewLoc(2) <= SizeOfEnvironmet(4) && NewLoc(2) >= SizeOfEnvironmet(3)
            %         check for other agents location. Does not move on agent.
            if ~sum(prod(NewLoc == AgentsLoc))
                PreyLoc = NewLoc;
                %         remove old, draw new
                PL_scatter.XData = PreyLoc(1);
                PL_scatter.YData = PreyLoc(2);
                break;
            end
        end
    end
    % removes unavailable move from the list
    moves = moves(moves~= newMove);
%     if no more available moves are left - victory (for agents)
    if isempty(moves)
        disp('boom'); % improve victory animation
    end 
end