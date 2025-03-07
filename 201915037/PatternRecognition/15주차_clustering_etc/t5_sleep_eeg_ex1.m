clear all; close all; clc;

SLEEP_EEG = [];

for subj = 1:1:5
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/10주차/Subject' num2str(subj)];
    cd(folder_name);

    load SLEEP_EEG_POWER.mat;
    
    tmp_light = [];
    tmp_light = [EEG_alpha_light EEG_theta_light EEG_delta_light EEG_swa_light];

    tmp_deep = [];
    tmp_deep = [EEG_alpha_deep EEG_theta_deep EEG_delta_deep EEG_swa_deep];

    tmp_wake = [];
    tmp_wake = [EEG_alpha_wake EEG_theta_wake EEG_delta_wake EEG_swa_wake];

    tmp_rem = [];
    tmp_rem = [EEG_alpha_REM EEG_theta_REM EEG_delta_REM EEG_swa_REM];

    SLEEP_EEG = [SLEEP_EEG; tmp_wake; tmp_light; tmp_deep; tmp_rem];
    
    
end

%%
eva = evalclusters(SLEEP_EEG,'kmeans','CalinskiHarabasz','KList',1:10);
eva
%%

clear all; close all; clc;

SWS_EEG = [];
NSWS_EEG = [];

for subj = 1:1:5
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/10주차/Subject' num2str(subj)];
    cd(folder_name);

    load SLEEP_EEG_POWER.mat;
    
    tmp_light = [];
    tmp_light = [EEG_alpha_light EEG_theta_light EEG_delta_light EEG_swa_light];

    tmp_deep = [];
    tmp_deep = [EEG_alpha_deep EEG_theta_deep EEG_delta_deep EEG_swa_deep];

    tmp_wake = [];
    tmp_wake = [EEG_alpha_wake EEG_theta_wake EEG_delta_wake EEG_swa_wake];

    tmp_rem = [];
    tmp_rem = [EEG_alpha_REM EEG_theta_REM EEG_delta_REM EEG_swa_REM];

    NSWS_EEG = [NSWS_EEG; tmp_wake; tmp_light; tmp_rem];
    SWS_EEG = [SWS_EEG; tmp_deep];
end

%%
EEG_SET = [];
EEG_SET = [NSWS_EEG; SWS_EEG];
SL_LABEL = [];
SL_LABEL = [ones(length(NSWS_EEG), 1); 2*ones(length(SWS_EEG), 1)];

figure;
plot(EEG_SET(SL_LABEL==1 ,3), EEG_SET(SL_LABEL==1,4),'k*','MarkerSize',5); hold on;
plot(EEG_SET(SL_LABEL==2 ,3), EEG_SET(SL_LABEL==2,4),'r*','MarkerSize',5); hold off;

[idx,C] = kmeans(EEG_SET(:,3:4), 2);

figure;
plot(EEG_SET(idx==1,3),EEG_SET(idx==1,4),'r.','MarkerSize',12)
hold on
plot(EEG_SET(idx==2,3),EEG_SET(idx==2,4),'b.','MarkerSize',12)
hold on
plot(C(:,1),C(:,2),'kx',...
     'MarkerSize',15,'LineWidth',3) 
legend('Cluster 1','Cluster 2','Centroids',...
       'Location','NW')
title 'Cluster Assignments and Centroids'
hold off


