% 데이터 불러오기
clear all; close all; clc;

All_EEG_alpha_deep = [];
All_EEG_alpha_light = [];
All_EEG_alpha_wake = [];
All_EEG_alpha_REM = [];

All_EEG_theta_deep = [];
All_EEG_theta_light = [];
All_EEG_theta_wake = [];
All_EEG_theta_REM = [];

All_EEG_delta_deep = [];
All_EEG_delta_light = [];
All_EEG_delta_wake = [];
All_EEG_delta_REM = [];

All_EEG_swa_deep = [];
All_EEG_swa_light = [];
All_EEG_swa_wake = [];
All_EEG_swa_REM = [];

for subj=1:1:5
    folder_name=[];
    folder_name=['/Users/iamseungman/Documents/MATLAB/10주차/Subject' num2str(subj)]  %숫자를 string으로 변경

    cd(folder_name);

    load SLEEP_EEG_POWER.mat;

    All_EEG_alpha_deep = [All_EEG_alpha_deep;EEG_alpha_deep];
    All_EEG_alpha_light = [All_EEG_alpha_light;EEG_alpha_light];
    All_EEG_alpha_wake = [All_EEG_alpha_wake;EEG_alpha_wake];
    All_EEG_alpha_REM = [All_EEG_alpha_REM;EEG_alpha_REM];

    All_EEG_theta_deep = [All_EEG_theta_deep;EEG_theta_deep];
    All_EEG_theta_light = [All_EEG_theta_light;EEG_theta_light];
    All_EEG_theta_wake = [All_EEG_theta_wake;EEG_theta_wake];
    All_EEG_theta_REM = [All_EEG_theta_REM;EEG_theta_REM];

    All_EEG_delta_deep = [All_EEG_delta_deep;EEG_delta_deep];
    All_EEG_delta_light = [All_EEG_delta_light;EEG_delta_light];
    All_EEG_delta_wake = [All_EEG_delta_wake;EEG_delta_wake];
    All_EEG_delta_REM = [All_EEG_delta_REM;EEG_delta_REM];  

    All_EEG_swa_deep = [All_EEG_swa_deep;EEG_swa_deep];
    All_EEG_swa_light = [All_EEG_swa_light;EEG_swa_light];
    All_EEG_swa_wake = [All_EEG_swa_wake;EEG_swa_wake];
    All_EEG_swa_REM = [All_EEG_swa_REM;EEG_swa_REM];    
end


%평균계산
mean_set=[];

alpha_mean_set=[mean(All_EEG_alpha_deep) mean(All_EEG_alpha_light) mean(All_EEG_alpha_wake) mean(All_EEG_alpha_REM)];
theta_mean_set=[mean(All_EEG_theta_deep) mean(All_EEG_theta_light) mean(All_EEG_theta_wake) mean(All_EEG_theta_REM)];
delta_mean_set=[mean(All_EEG_delta_deep) mean(All_EEG_delta_light) mean(All_EEG_delta_wake) mean(All_EEG_delta_REM)];
swa_mean_set=[mean(All_EEG_swa_deep) mean(All_EEG_swa_light) mean(All_EEG_swa_wake) mean(All_EEG_swa_REM)];

%bar그래프 
subplot(1,4,1)
bar(alpha_mean_set); title('relative alpha power');
xticks([1 2 3 4]);
xticklabels({'DS','LS','W','RS'});

subplot(1,4,2)
bar(theta_mean_set); title('relative theta power');
xticks([1 2 3 4]);
xticklabels({'DS','LS','W','RS'});

subplot(1,4,3)
bar(delta_mean_set); title('relative delta power');
xticks([1 2 3 4]);
xticklabels({'DS','LS','W','RS'});

subplot(1,4,4)
bar(swa_mean_set); title('relative swa power');
xticks([1 2 3 4]);
xticklabels({'DS','LS','W','RS'});


