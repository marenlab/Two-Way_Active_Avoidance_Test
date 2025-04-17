
%% Two-Way Active Avoidance Test Analysis - Conditioning phase
% Plots

% This code is designed to create plots...

% INPUT (Up until now):
% Summary


% by Flavio Mourao and Samantha Plas

% email: mourao.fg@illinois.edu
% Maren Lab - Beckman Institute for Advanced Science and Technology
% University of Illinois Urbana-Champaign

% Started in:  04/2025
% Last update: 04/2025

%% Simple bar plot
% Up until now, plotting individual data


for ii = 1:size(Summary,1)
    
    figure
    set(gcf, 'Position', [100, 100, 1440, 420])

    for jj = 1:size(Summary,2)

        titles_ = {'Acclimation phase','Pavlovian CS phase','CS, US, and ITI periods'};

        subplot(1,3,jj)

        xLabels = Summary{ii,jj}.EventType;
        yValues = Summary{ii,jj}.Count;

        bh = bar(xLabels, yValues,'FaceColor',[0.4660 0.6740 0.1880]);
        ylabel('Total Shuttles');
        title(titles_{jj});
        xtickangle(45);

        ylim([0 max(yValues) + 5])

        xtips = bh.XEndPoints;
        ytips = bh.YEndPoints;
        labels = string(yValues);

        text(xtips, ytips + max(yValues)*0.02, labels, ...
            'HorizontalAlignment', 'center', ...
            'VerticalAlignment', 'bottom', ...
            'FontSize', 10);

    end

    % Saving...

    % Settings
    save_dir = fullfile(header.FilePattern.folder, 'figs'); % Creating a new folder
    mkdir(save_dir); 

    name = strcat(header.Filename_csv{ii, 1}(1:end-4), '.png');
    save_path = fullfile(save_dir, name);

    % Save
    saveas(gcf,save_path,'png')
    clear('name','ii','jj','ii','bh','labels','xLabels','titles_','xtips','ytips','yValues','save_dir','save_path')

    close all

end

% add new plots from here.....

%% last update 04/16/2025 - 15:04
% listening: Nirvana - love buzz
