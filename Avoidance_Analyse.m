
%%  Two-Way Active Avoidance Test Analysis

% Main call
% - Analyse one or more *.csv
% - The code relies on the following functions/scripts : -> Avoidance_conditioning.m

% Files needed:
% - *.csv files  generated by Colbourn active avoidance chamber


% by Flavio Mourao and Samantha Plas

% email: mourao.fg@illinois.edu
% Maren Lab - Beckman Institute for Advanced Science and Technology
% University of Illinois Urbana-Champaign

% Started in:  04/2025
% Last update: 04/2025

%% Define settings

prompt        = {'Experiment Name';'Experiment (Type (1) to  Conditioning / Type (2) to Retrieval):'; ...
    'Plot Figures (Type (1) yes / Type (2) no)'};

dlgtitle      = 'Define Settings';
dims         = [1 80];
default_input = {'Avoidance','1','2'};

input_settings = inputdlg(prompt,dlgtitle,dims,default_input);

clear('prompt','dlgtitle','default_input','dims')

if isempty(input_settings)
    fprintf(1, '\nAnalysis got canceled? Dude, you cant be serious\n');
    return
end

%% Organize path to load data and initialize some variables

% Load datafiles (*.csv)
[FileName,PathName] = uigetfile({'*.csv'},'MultiSelect', 'on'); % Define file type *.*

if isequal(FileName,0)
    fprintf(1, '\nSelected Canceled. At least one file must be selected\n');
    return
end


% Filename can be organize as a single char or a group char in a cell depending on the number os files selected

% header -> files information and parameters to analyse

% data = raw values / each cell corresponds to data from 1 experiment

%raw_data = cell(size(FileName,2),1);


if ischar(FileName) == 1 % condition for a single file selected
    
    header.FilePattern = dir(fullfile(PathName, char(FileName)));
    [~, ~, fExt] = fileparts(FileName);

    switch lower(fExt)

        case '.csv'
            raw_data{1,1} = readtable([PathName '/' FileName],'Delimiter',',','TextType', 'string');
            header.Filename_csv{1,1} = FileName;
            fprintf(1, 'Reading %s\n', FileName);


    end

else      % condition for multiple files selected
    
    FileName = FileName';

    for ii = 1:length(FileName)        
        header.FilePattern = dir(fullfile(PathName, char(FileName{ii,1})));
        [~, ~, fExt] = fileparts(FileName{ii});

        switch lower(fExt)

            case '.csv'
                raw_data{ii,1} = readtable([PathName '/' FileName{ii,1}],'Delimiter',',','TextType', 'string');
                header.Filename_csv{ii,1} = FileName{ii,1};
                fprintf(1, 'Reading: %s\n', FileName{ii,1});

        end
    end

    % Remove empty cells
    raw_data = raw_data(~cellfun('isempty',raw_data));
    header.Filename_csv = header.Filename_csv(~cellfun('isempty',header.Filename_csv));

end




%% Set default values
set(0,'DefaultFigureWindowStyle','normal')


%% Call functions

if str2num(input_settings{2, 1}) == 1

    for ii = 1:size(raw_data, 1)

        [Output_Events(ii,:), Intervals(ii,:),Summary(ii,:)] = Avoidance_conditioning(raw_data{ii,1});

        if ischar(FileName) == 1
            fprintf(1, 'Analyzing: %s\n', FileName);
        else
            fprintf(1, 'Analyzing: %s\n', FileName{ii})
        end

    end

elseif str2num(input_settings{2, 1}) == 2

    disp([newline 'Still working on new functions, dude.' newline]);

end
%% Call custom scripts

   Avoidance_stats % Example of scripts that can be used to organize the final outputs

   if str2num(input_settings{3, 1}) == 1
      Avoidance_plots
   end

%% just cleaning the workflow
clear ('fExt','FileName','ii','PathName','name','animal_id','path');

%% Save data

% Settings
name  = strcat(header.FilePattern.folder,'/',input_settings{1, 1});

% Save
save(name,'-v7.3')

clear('name')

%% last update 04/15/2025 - 20:43
% listening: ISIS - So Did We
