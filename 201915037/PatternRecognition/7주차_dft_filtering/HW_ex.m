%%
clear all; close all; clc;

cd '/Users/iamseungman/Documents/MATLAB/7주차_dft_filtering';

load data;
Fs = 500;
x = 1/Fs:1/Fs:10;

% 시간 영역에서 보기
figure;
plot(x, data);

% 주파수 영역에서 보기 (DFT)
Xout = [];
for k=0:1:length(x) - 1
    Xout(k+1) = 0;
    for n=0:1:length(x) - 1
        Xout(k+1) = Xout(k+1) + ( data(n + 1) * exp(-j*2*pi*k*n / length(x)) );
    end
end

% 이 부분 부터는 시각화를 어떻게 할 것이냐에 해당 됨
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

%% 1. 위 DFT코드를 참고하여 IDFT 코드를 구현하시오  
x_recon = [];
for k=0:1:length(x_recon)-1
    x_recon(k+1)=0;
    for n=0:1:length(x)-1
        x_recon(k+1)=x_recon(k+1) + (1/length(x))*( x(n + 1) * exp(j*2*pi*k*n / length(x)) );
    end
    x_recon(n+1) = x_recon(n+1)/length(Xout);
end
x_recon_final = real(x_recon);

figure;
plot(x_recon_final);

figure;
plot(abs(x_recon_final));

% 1. 크기값을 조정
tmp = abs(x_recon_final/length(x_recon_final));

% 2. 주파수의 반만 보면 되므로, 반까지만 데이터를 가지고 옴
Xfinal = tmp(1:length(x_recon_final)/2+1);

% 3. X(0)를 대칭으로 크기가 반이 됨을 보정 함
Xfinal(2:end-1) = 2*Xfinal(2:end-1);

% 4. x축을 주파수로 반만 표현하면되는데, 0 ~ Fs/2 Hz까지
f = Fs*( 0:1:(length(x_recon_final)/2) ) / length(x_recon_final);

figure;
plot(f, Xfinal);
xlabel('frequency (Hz)');
ylabel('amplitude (a.u.)');

%% 2. 위 주파수 영역 그림을 보고 걸려야할 주파수 대역을 선정하여 FIR, IIR 필터 계수를 만들고 필터링 하시오
% cutoff-frequency, 필터 종류(FIR or IIR), 필터 계수의 개수는 여러분이 임의로 정하면 됨
% h = fir1(~~, ~~/(Fs/2), 'low');
% [b, a] = butter(~~, ~~/(Fs/2), 'low');


%% 3. 필터링된 결과를 시간영역, 주파수 영역에서 그림을 그리시오.
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



