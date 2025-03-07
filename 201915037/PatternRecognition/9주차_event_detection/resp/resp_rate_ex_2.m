clear all; close all; clc;

cd '/Users/iamseungman/Documents/MATLAB/9주차_event_detection/resp';

load resp_data;

% HPF 설계 & 필터링 0.1Hz 이상만 통과 
[b, a] = butter(5, 0.1/(Fs/2), 'high');
fdata  = filtfilt(b, a, data);

% LPF 설계 & 필터링 1Hz 이하만 통과 
[b, a] = butter(5, 1/(Fs/2), 'low');
fdata  = filtfilt(b, a, fdata);

x = 1/Fs:1/Fs:length(data)/Fs;

figure;
subplot(211); plot(x, data); axis tight;
subplot(212); plot(x, fdata); axis tight;

%% 30초데이터를 이용하여 5초에 한번씩 평균 호흡수를 계산한다
% 90초 데이터, 30초 데이터 5초씩 이동: 0~30초, 5~35초, 10~40초, ... 60~90초
% 25초씩 겹침

len_loop = ( length(data)/Fs/5 ) - 5; %0~30초,5~35초... : 13개 (90/5=18)-5(곂치는 수), 
resp_rate = zeros(len_loop, 1);

for k=1:1:len_loop
    tmpdata = fdata( (k - 1) * Fs * 5 + 1 : (k + 5) * Fs * 5); %!!!중요함: 1~7500 1251~8750 이해하기  (0~30초)  
    
    [pxx, f] = periodogram(tmpdata, [], length(tmpdata), Fs);
    [mv, mi] = max(pxx);
    resp_freq = f(mi);    
    resp_interval = 1/resp_freq;

    resp_rate(k) = 60/resp_interval;
end


figure;
plot(resp_rate, 'LineWidth', 2); xlabel('epoch (10s)'); ylabel('respiratory rate (breathing per minute)');