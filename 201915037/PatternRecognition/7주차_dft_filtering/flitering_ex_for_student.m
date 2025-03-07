clear all; close all; clc;

Fs = 500;
t = 1/Fs:1/Fs:10;

x = cos(2*pi*1*t)+ 0.5*cos(2*pi*50*t); %50Hz 빼는 filter

figure;
plot(t, x);

fft_res = fft(x);

P2 = abs(fft_res/length(fft_res));
P1 = P2(1:length(fft_res)/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(length(fft_res)/2))/length(fft_res);

figure;
plot(f, P1); xlabel('frequency (Hz)');

%% 필터링 (FIR)
% 계수 h를 101개 만들겠다
h = fir1(100, 20/(Fs/2), 'low');

% 시간영역에서 그리기
figure; 
plot(h, 'r.:');

% 주파수 영역에서 그리기
h_fft_res = fft(h);

P2 = abs(h_fft_res/length(h_fft_res));
P1 = P2(1:length(h_fft_res)/2+1);
P1(1:end-1) = 2*P1(1:end-1);

f = Fs*(0:(length(h_fft_res)/2))/length(h_fft_res);

figure;
plot(f, P1, 'r.:');

% 시간영역에서 필터링
filt_res_fir = filtfilt(h, 1, x);

figure;
plot(t, x); hold on;
plot(t, filt_res_fir, 'LineWidth', 2); hold on;

% 필터링된 신호를 주파수 영역에서 그려보기
filt_fir_fft_res = fft(filt_res_fir);

P2 = abs(filt_fir_fft_res/length(filt_fir_fft_res));
P1 = P2(1:length(filt_fir_fft_res)/2+1);
P1(1:end-1) = 2*P1(1:end-1);

f = Fs*(0:(length(filt_fir_fft_res)/2))/length(filt_fir_fft_res);

figure;
plot(f, P1);
%% 필터링 (IIR)
% 계수 b, a를 6개 만들겠다
[b, a] = butter(5, 20/(Fs/2), 'low');

% 시간영역에서 필터링
filt_res_iir = filtfilt(b, a, x);

figure;
plot(t, x); hold on;
plot(t, filt_res_iir, 'LineWidth', 2); hold on;

figure;
plot(t, x); hold on;
plot(t, filt_res_fir, 'LineWidth', 2); hold on;
plot(t, filt_res_iir, 'LineWidth', 2); hold on;
