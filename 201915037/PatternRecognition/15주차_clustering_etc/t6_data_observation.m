clear all; close all; clc;


figure;
for subj = 1:1:5

    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/15주차_clustering_etc/Subject' num2str(subj)];
    cd(folder_name);

    load SLEEP_EEG_POWER.mat

    plot(EEG_delta_deep); hold on;
end

figure;
for subj = 1:1:5

    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/15주차_clustering_etc/Subject' num2str(subj)];
    cd(folder_name);

    load SLEEP_EEG_POWER.mat

    plot(EEG_delta_light); hold on;
end




