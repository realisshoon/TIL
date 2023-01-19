clear all; close all; clc;

cd '/Users/iamseungman/Documents/MATLAB/9주차_event_detection/hbi';

load example_ECG_2;

Fs = 256;
x = 1/Fs:1/Fs:length(data)/Fs; 

figure;
plot(x, data); xlabel('Time(s)'); %자글자글함 

[pxx, f] = periodogram(data, [], length(data), Fs); %양측주기도 측정값

figure;
plot(f, pxx); xlabel('Frequency (hz)'); %60초 
%%
%filtering
[b, a] = butter(5, 12/(Fs/2), 'low'); % ***조정가능***
fdata = filtfilt(b, a, data);

[b, a] = butter(5, 1.2/(Fs/2), 'high'); % ***조정가능***
fdata = filtfilt(b, a, fdata);

figure;
plot(x, fdata); xlabel('Time(s)');  %T가 엄청큼

[pxx, f] = periodogram(fdata, [], length(fdata), Fs);

figure;
plot(f, pxx); xlabel('Frequency (hz)');

%%
% 미분
d_data = diff(fdata); % 뒤에서 앞에 데이터를 뺀다, 갯수가 한개 줄어든다

% 절대값
abs_data = abs(d_data);

% % 이동평균 with c style
% window = zeros(100, 1);
% outdata = [];
% 
% for k=1:1:length(fdata)
%     for j = 1:1:length(window) - 1
%         window(j) = window(j+1);
%     end
%     window(end) = fdata(k);
%     
%     outdata(k) = mean(window);
% end


% 이동평균을 여러 번 한다
mwa_data = smooth(abs_data, floor(0.3*Fs), 'moving'); % 0.3*Fs: 윈도우 크기 조정***조정가능***
mwa_data = smooth(mwa_data, floor(0.2*Fs), 'moving'); % 0.3*Fs: 윈도우 크기 조정***조정가능***
mwa_data = smooth(mwa_data, floor(0.1*Fs), 'moving'); % 0.3*Fs: 윈도우 크기 조정***조정가능***

%층을 여러개 만들어서 더 부드럽게 만들어도 가능
figure;
plot(x(2:end), mwa_data);  xlim([10 20]); %미분해서 결과가 하나 줄었음

[pv, pi] = findpeaks(mwa_data);

figure;
subplot(211); plot(x, fdata, 'LineWidth', 2); axis tight;  xlim([10 20]);
subplot(212); plot(x(2:end), mwa_data, 'LineWidth', 2); hold on; 
plot(pi./Fs, pv, 'ro'); axis tight; xlim([10 20]);
xlabel('time (s)'); ylabel('amplitude(v)');

% 최종 피크 찾기
ecg_peak = [];
for k=2:1:length(pi)
    tmp = fdata(pi(k)-round(Fs/15):pi(k)); % 15: 몇번째 앞에서 최종 피크를 찾을 것인가***조정가능***
    [ev, ei] = findpeaks(tmp); 
    
    if length(ei) ~= 0
        ecg_peak = [ecg_peak; ei+pi(k)-round(Fs/15)-1]; % 15: 몇번째 앞에서 최종 피크를 찾을 것인가***조정가능***
    end
end

figure;
plot(x, fdata, 'LineWidth', 2); hold on; 
plot(ecg_peak/Fs, fdata(ecg_peak), 'ro'); axis tight; 

rri = diff(ecg_peak)/Fs; %심박간격

figure; %심박간격
plot(ecg_peak(2:end)/Fs, rri, 'ro:', 'LineWidth', 2);
xlabel('Time (s)'); ylabel('r-r interval (s)');



