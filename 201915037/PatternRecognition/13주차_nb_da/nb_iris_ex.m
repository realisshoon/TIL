%% naive bayes
clear all; close all; clc;

load fisheriris;

%특징그려보기
figure;
gscatter(meas(:,3), meas(:,4), species,'rgb','osd'); 

%% training/validation set, test set 나누기
tv_id = (1:1:150)'; %1~150 training val
ts_id = [46:50, 96:100, 146:150]'; %training set
tv_id(ts_id,:) = []; 

X_tv = meas(tv_id,3:4);
Y_tv = species(tv_id,:);

X_ts = meas(ts_id,3:4);
Y_ts = species(ts_id,:);

%%
% 사전확률지정해주기 (안해줘도 됨. 안해주면 동일한 사전확률로 자동 결정) 
prior = [0.3333 0.3333 0.3333];

nb_Model = fitcnb(X_tv,Y_tv,'ClassNames',{'setosa','versicolor','virginica'}, 'Prior',prior); %안 넣어도 상관없('Class~~)

% 10fold 교차 검증
rng(1);
cp = cvpartition(Y_tv,'KFold',10); %data를 10등분

cv_nb = crossval(nb_Model,'CVPartition',cp);

% 10번의 교차검증에서의 오차정도
nbCVErr = kfoldLoss(cv_nb) %10번  사전확률 지정 data 학습 => cross val 오차가 0.0444나오더라
label_tv = predict(nb_Model,X_tv); 

figure;
confusionchart(Y_tv,label_tv); %실제 정답과 추정한 답을 matrix로

%%
label_ts = predict(nb_Model,X_ts); 

figure;
confusionchart(Y_ts,label_ts);

