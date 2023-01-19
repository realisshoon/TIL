%% HR_SET의 심박수,PAT로 SBP 추정하는 중회귀분석
clear all; close all; clc;

cd '/Users/iamseungman/Documents/MATLAB/12주차_regression'

load TR_SET.mat;

%%
% figure;  
% plot(Feature_PAT,SBP,'ro')

figure;  
plot(Feature_HR,SBP,'bo')

[r,p]=corrcoef(Feature_HR,SBP)

A = [];
A(:,1) = ones(length(SBP), 1);
A(:,2) = Feature_PAT;
A(:,3) = Feature_HR;

% 회귀 계수만들기
w  = A\SBP  %A라는 행렬에 SBP
% w2 = ((A'*A)^-1)*A'*SBP
% [w3,~,~,~,stats] = regress(SBP, A);

% 회귀계수로 SBP 추정해보기, y = a + bx
SBP_est   =  w(1)+w(2)*Feature_PAT+w(3)*Feature_HR;

%SBP_est   =  w(1)+w(2)*Feature_PAT;

% 그림그려보기
figure;   
plot(SBP,SBP_est,'rx','LineWidth',6); hold on;
xlabel('Reference SBP(mmHg)'); ylabel('Estimated SBP(mmHg)');

x=110:1/1000:170;
y = x;
plot(x, y,'k','LineWidth',2);  hold off;

% 실제SBP와 추정SBP의 상관계수
[r, p] = corrcoef(SBP, SBP_est)

% 평균절대오차계산
mean(abs(SBP-SBP_est))


%% 위에서 만든 식을 평가해보기
load VAL_SET;

VAL_SBP_est = w(1)+w(2)*VAL_Feature_PAT+w(3)*VAL_Feature_HR;

figure;   
plot(VAL_SBP,VAL_SBP_est,'rx','LineWidth',6); hold on;
xlabel('Reference SBP(mmHg)'); ylabel('Estimated SBP(mmHg)');

x=110:1/1000:170;
y = x;
plot(x, y,'k:','LineWidth',2);  hold on;

% 실제SBP와 추정SBP의 상관계수
[r, p] = corrcoef(VAL_SBP, VAL_SBP_est)

% 평균절대오차계산
mean(abs(VAL_SBP-VAL_SBP_est))  %중요

% 상관계수를 이용한 평가
AA = [];
AA(:,1) = ones(length(VAL_SBP), 1);
AA(:,2) = VAL_SBP_est;

w_est  = AA\VAL_SBP

x2=110:1/1000:170;
y_est = w_est(1)+w_est(2)*x2;

plot(x2, y_est,'LineWidth', 1.5);  hold on;





         