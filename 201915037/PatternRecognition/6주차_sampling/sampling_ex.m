clear all; close all; clc;

cd '/Users/iamseungman/Documents/MATLAB/6주차_sampling'

% 초당 500개 (샘플링주파수 = 500Hz), 5초간 수집
load data;

%x축: 샘플로 그려보기
figure;
plot(data);

%x축: 시간으로 그려보기
% 1/500, 2/500, 3/500, ...500/500=1s
Fs = 500;

x = 1:1:length(data);
x = x/Fs;

figure;
plot(x, data, 'LineWidth', 2, 'Color', 'r');%x축,y축, 두께, 색상
title('ECG'); xlabel('time (s)'); ylabel('amplitude');

%%
clear all; close all; clc;

cd '/Users/iamseungman/Documents/MATLAB/6주차_sampling'

% 초당 500개 (샘플링주파수 = 500Hz), 5초간 수집
load data;
Fs = 500;

%x축: 시간으로 그려보기
% 1/500, 2/500, 3/500, ...
x = 1:1:length(data);
x = x/Fs;

figure;
plot(x, data);

% 샘플링 주파수가 500Hz이므로 이 데이터는 250Hz까지 표현이 가능 (Fm <= 2*Fs)
% 강제로 샘플링 주파수를 낮춰보자
% 초당 500개 받은 것을 250개, 100개, 50개, 10개로 낮춰봄
% 초당 250개, 100개, 50개, 10개의 데이터를 받았으니, 샘플링주파수가 250Hz, 100Hz, 50Hz, 10Hz인 것과 같고,
% 나이퀴스트 샘플링 이론에 따라, 125Hz, 50Hz, 25Hz, 5Hz까지 표현가능 할 것

data_250 = []; % 초당 250개 * 5초
data_100 = []; % 초당 100개 * 5초
data_50  = []; % 초당 50개 * 5초
data_10  = []; % 초당 10개 * 5초

x_250 = []; 
x_100 = []; 
x_50  = [];
x_10  = [];

for k = 1:1:length(data)
    if mod(k, 2) == 1 %mod(): 나머지계산
        data_250 = [data_250 data(k)];
        x_250    = [x_250 k];
    end
    
    if mod(k, 5) == 1
        data_100 = [data_100 data(k)];
        x_100    = [x_100 k];
    end
    
    if mod(k, 10) == 1
        data_50 = [data_50 data(k)];
        x_50    = [x_50 k];
    end
    
    if mod(k, 50) == 1
        data_10 = [data_10 data(k)];
        x_10    = [x_10 k];
    end
end


x_250 = x_250/500;
x_100 = x_100/500;
x_50 = x_50/500;
x_10 = x_10/500;


figure;
subplot(511); plot(x, data); 
subplot(512); plot(x_250, data_250); 
subplot(513); plot(x_100, data_100); 
subplot(514); plot(x_50, data_50); 
subplot(515); plot(x_10, data_10); 
%%
figure;
plot(x, data); hold on; %hold on: 그래프 겹치기
plot(x_250, data_250); hold on;
plot(x_100, data_100); hold on;
plot(x_50, data_50); hold on;
plot(x_10, data_10); hold on;



