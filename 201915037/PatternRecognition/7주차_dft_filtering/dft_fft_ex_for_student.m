%%
clear all; close all; clc;

Fs = 500; % 실제로 볼수 있는 구간은 0 ~ 250Hz까지
t = 1/Fs:1/Fs:10;

x = cos(2*pi*1*t);% + 0.5*cos(2*pi*3*t);

figure;
plot(t, x);
%% DFT
tic;  %시간 측정하는 연산
Xout = [];
for k=0:1:length(x) - 1
    Xout(k+1) = 0; %matlab에서 시작점:1 
    for n=0:1:length(x) - 1
        Xout(k+1) = Xout(k+1) + ( x(n + 1) * exp(-j*2*pi*k*n / length(x)) );
    end
end
toc;

figure;
plot(Xout);

figure;
plot(abs(Xout));

%%%% 이 부분 부터는 시각화를 어떻게 할 것이냐에 해당 됨
% 1. 크기값을 조정
tmp = abs(Xout/length(Xout));

% 2. 주파수의 반만 보면 되므로, 반까지만 데이터를 가지고 옴
Xfinal = tmp(1:length(Xout)/2+1);

% 3. X(0)를 대칭으로 크기가 반이 됨을 보정 함
Xfinal(2:end-1) = 2*Xfinal(2:end-1);

% 4. x축을 주파수로 반만 표현하면되는데, 0 ~ Fs/2 Hz까지
f = Fs*( 0:1:(length(Xout)/2) ) / length(Xout);

figure;
plot(f, Xfinal);
xlabel('frequency (Hz)');
ylabel('amplitude (a.u.)');


%% IDFT (과제입니다)
x_recon = my_idft(Xout); % 이부분을 구현하는 것
x_recon_final = real(x_recon);

figure;
plot(t, x_recon_final); hold on; plot(t, x);

figure;
plot(x_recon_final - x);

%% FFT
tic;
Xout_fft = fft(x);
toc;
figure;
plot(abs(Xout));

P2 = abs(Xout_fft/length(Xout_fft));
P1 = P2(1:length(Xout_fft)/2+1);
P1(2:end-1) = 2*P1(2:end-1);

f = Fs*(0:(length(Xout_fft)/2))/length(Xout_fft);

figure;
plot(f,P1);
xlabel('frequency (Hz)');
ylabel('amplitude (a.u.)');
%% IFFT
x_recon_ifft = ifft(Xout_fft);

figure; 
plot(t, x_recon_ifft);
