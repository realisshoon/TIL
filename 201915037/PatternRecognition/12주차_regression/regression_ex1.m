%% 회귀 계수 연습
clear all; close all; clc;

y = 10:0.1:30; %10~30 증가하는 숫자 행렬(벡터)
y_t = y' + randn(length(y), 1); % y' -> 행벡터를 열벡터로, 열벡터를 행벡터로 (transpose(y)와 동일). y에 난수를 더 함


x = 1:0.01:3; %1~3 증가하는 숫자 행렬(벡터)
x_t = x' + 0.3*randn(length(x), 1); % x' -> 행벡터를 열벡터로, 열벡터를 행벡터로 (transpose(x)와 동일). x에 난수를 더 함

figure;
plot(x, y, 'ro');

figure;
plot(x_t, y_t, 'ro');

%%
A = [];
A(:,1) = x_t;
A(:,2) = ones(length(x_t), 1);


% A = [x_t ones(length(x_t), 1)];

w  = A\y_t % \ 계수가 만들어짐   y=ax+b
w2 = ((A'*A)^-1)*A'*y_t  %pusdo inverse 
w3 = regress(y_t, A) %자체 함수


y_est = w(1)*x+w(2);

figure;
plot(x, y_est, 'LineWidth', 2); hold on;
plot(x_t, y_t, 'ro'); hold off;
