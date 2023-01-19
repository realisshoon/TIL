clear all; close all; clc;

cd '/Users/iamseungman/Documents/MATLAB/9주차_event_detection/resp';

load sample_resp;

% HPF 설계 & 필터링 0.1Hz 이상만 통과 
[b, a] = butter(5, 0.1/(Fs/2), 'high'); 
fdata  = filtfilt(b, a, data);

% LPF 설계 & 필터링 1Hz 이하만 통과 
[b, a] = butter(5, 1/(Fs/2), 'low');
fdata  = filtfilt(b, a, fdata);

x = 1/Fs:1/Fs:length(data)/Fs;
%x=1:1:length(data);
figure;
subplot(211); plot(x, data); axis tight;  
subplot(212); plot(x, fdata); axis tight;  %필터링 이후

%% 주파수 변환해보기
[pxx, f] = periodogram(fdata, [], length(fdata), Fs); 
figure;
plot(f, pxx);

figure;
plot(f, pxx); xlim([0.01 1]) %x:호흡주파수 

%% 호흡 주파수 찾기
[mv, mi] = max(pxx) %최대 호흡수를 찾고
resp_freq = f(mi) %그에 해당하는 주파수를 찾아라

figure;
plot(f, pxx); xlim([0.01 1])

%% 호흡 주기 계산
resp_interval = 1/resp_freq;

%% 평균 호흡수 (breathing per minute) 계산 
resp_rate = 60/resp_interval