%% Two-Way Active Avoidance Test Analysis - Conditioning phase
% Stats

% This code is designed to facilitate the visualization and organization of experimental data outputs
% by aligning them with the various event types occurring throughout the session

% INPUT:

% The input dataset comes from the Summary output, containing all total shuttles from the experimental phase for all animals.

% OUTPUT:

% Stats.summary --> 1x3 ceel array, where:
% - Column 1 → Acclimation phase
% - Column 2 → Pavlovian CS phase
% - Column 3 → CS, US, and ITI periods of the avoidance session

% Within each cell, each column corresponds to one animal for a given event.
% The order of animals follows the structure of the original upload folder, and can also be cross-checked using: header.Filename_csv

% *.csv file containing all data, with each experimental phase separated by blank lines.



% by Flavio Mourao and Samantha Plas

% email: mourao.fg@illinois.edu
% Maren Lab - Beckman Institute for Advanced Science and Technology
% University of Illinois Urbana-Champaign

% Started in:  04/2025
% Last update: 04/2025

%% Final Summary tables to stat all animals

for ii = 1:size(Summary,1)
    for jj = 1:size(Summary,2)

        if ii == 1

           Stats.summary{1,jj} = Summary{ii,jj};

        else
           
           Stats.summary{1,jj}(:,ii+1) = Summary{ii,jj}(:,2);


        end
    end
end

clear('ii','jj')


%% Renaming the column names according to the animals' IDs.

newColumnNames = header.Filename_csv';
currentNames = Stats.summary{1,1}.Properties.VariableNames;
currentNames(2:end) = newColumnNames;

for jj = 1:size(Summary,2)
    Stats.summary{1,jj}.Properties.VariableNames = currentNames;
end


clear('newColumnNames','currentNames','jj')


%% Save spreadsheet

Path  = header.FilePattern.folder;
name  = strcat(Path,'/',input_settings{1, 1},'.csv');

for ii = 1:size(Stats.summary,2)
    
    % Only write variable names for the first table
    writeHeader = (ii == 1);
    
    % Write the table (append mode)
    writetable(Stats.summary{1,ii}, name, ...
        'WriteVariableNames', writeHeader,'WriteMode','append','Delimiter',',');
    
    % Blank line to visually separate (optional)
    writecell({''}, name,'WriteMode', 'append');
end

clear('Path','name','ii','writeHeader')

%%

% add new stats from here.....

%% last update 04/16/2025
% listening: Sonic Youth - winners`s blues

