% Made by V.A. 2020-11-11
clc;
clear all;
close all;


AgentsN = 4;
SizeOfEnvironmet=[0 20 0 20]; % Size of Environmet (xmin xmax ymin ymax)
% apskaiciuoja x y arenos dydi
Xdiff = SizeOfEnvironmet(2) - SizeOfEnvironmet(1) + 1;
Ydiff = SizeOfEnvironmet(4) - SizeOfEnvironmet(3) + 1;
% paskiria random vietas, negali kartotis
AgentsLocX = randperm(Xdiff,AgentsN+1)-1;
AgentsLocY = randperm(Ydiff,AgentsN+1)-1;
% last element will be prey
PreyLoc = [AgentsLocX(end); AgentsLocY(end)];
% gather in one matrix all agents
AgentsLoc = [AgentsLocX(1:end-1); AgentsLocY(1:end-1)];
clear AgentsLocX AgentsLocY Ydiff Xdiff

% ploting stuff
whitebg('black')
hold on
AL_scatter = scatter(AgentsLoc(1,:),AgentsLoc(2,:),'r','filled');
PL_scatter = scatter(PreyLoc(1),PreyLoc(2),'g','filled');
% axis and grid for better visual
axis(SizeOfEnvironmet)
xticks(SizeOfEnvironmet(1):SizeOfEnvironmet(2))
yticks(SizeOfEnvironmet(3):SizeOfEnvironmet(4))
grid on

% make loop to simulate the game;
pause(0.4)
prey_move;

% for loop if all agents are homogeneous
for z=1:AgentsN
    This_agent = AgentsLoc(:,z);
    pause(0.1)
    agent_move;
     % if agentMoved
    % %         remove old, draw new
      AL_scatter.XData(z) = This_agent(1);
      AL_scatter.YData(z) = This_agent(2);
    % end
    AgentsLoc(:,z) = This_agent;
end

