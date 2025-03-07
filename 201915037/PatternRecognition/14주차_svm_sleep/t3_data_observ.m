clear all; close all; clc;

% comparison btw subjects
% 1번 피험자의 평균심박수와 2번 피험자의 평균심박수를 그려보자
% 결론: 기본 심박수가 다름 -> 정규화과 필요
subj = 1
folder_name = [];
folder_name = ['/Users/iamseungman/Documents/MATLAB/14주차_svm_sleep/Subject' num2str(subj)];
cd(folder_name);

load TimeDomainHRV;
M_HR_sub1 = M_HR;

figure;
plot(M_HR_sub1);  hold on; 

subj = 2
folder_name = [];
folder_name = ['/Users/iamseungman/Documents/MATLAB/14주차_svm_sleep/Subject' num2str(subj)];
cd(folder_name);

load TimeDomainHRV;
M_HR_sub2 = M_HR;

plot(M_HR_sub2);  axis tight;

%z-score로 정규화
nM_HR_sub1 = (M_HR_sub1-mean(M_HR_sub1))/std(M_HR_sub1);
nM_HR_sub2 = (M_HR_sub2-mean(M_HR_sub2))/std(M_HR_sub2);

figure;
plot(nM_HR_sub1); hold on;
plot(nM_HR_sub2); axis tight;

%%
clear all; close all; clc;

% 5번 피험자의 평균심박수와 평균심박수를 이동평균해서 그린 것을 그려보자
% 결론: 트랜드를 제거해야 함 

subj = 5
subj
folder_name = [];
folder_name = ['/Users/iamseungman/Documents/MATLAB/14주차_svm_sleep/Subject' num2str(subj)];
cd(folder_name);

load TimeDomainHRV;

smM_HR = smooth(M_HR, 55, 'moving');

figure;
subplot(211); plot(M_HR); hold on; plot(smM_HR, 'LineWidth', 1.5); hold on; plot(61*ones(length(stg), 1), 'LineWidth', 1.5); axis tight;
subplot(212); plot(stg); axis tight;

%%
%low pass filter를 이용하거나 ...
% 트렌드를 제거해보자

%high pass: 고주파만 획득
[b, a] = butter(5, 0.0001/((1/30)/2),'high');
fM_HR = filtfilt(b, a, M_HR);
dtrM_HR1 = fM_HR;

figure;
subplot(211); plot(dtrM_HR1); hold on; plot(smooth(dtrM_HR1, 50, 'moving'), 'LineWidth', 1.5); hold on; plot(2*ones(length(stg), 1), 'LineWidth', 1.5); axis tight;
subplot(212); plot(stg); axis tight;

%low pass: 저주파 성분만 제거
[b, a] = butter(5, 0.0001/((1/30)/2),'low');
fM_HR = filtfilt(b, a, M_HR);
dtrM_HR2 = M_HR-fM_HR;


figure;
subplot(211); plot(dtrM_HR2); hold on; plot(smooth(dtrM_HR2, 50, 'moving'), 'LineWidth', 1.5); hold on; plot(2*ones(length(stg), 1), 'LineWidth', 1.5); axis tight;
subplot(212); plot(stg); axis tight;


