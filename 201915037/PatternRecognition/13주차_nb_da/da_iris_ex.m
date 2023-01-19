%% LDA
clear all; close all; clc;

load fisheriris;

%특징그려보기
figure;
gscatter(meas(:,3), meas(:,4), species,'rgb','osd');

%% training/validation set, test set 나누기
tv_id = (1:1:150)';
ts_id = [46:50, 96:100, 146:150]';
tv_id(ts_id,:) = [];

X_tv = meas(tv_id,3:4);
Y_tv = species(tv_id,:);

X_ts = meas(ts_id,3:4);
Y_ts = species(ts_id,:);

%% LDA
prior = [0.3333 0.3333 0.3333];
lda_Model = fitcdiscr(X_tv,Y_tv,'ClassNames',{'setosa','versicolor','virginica'}, 'DiscrimType','linear', 'Prior',prior);
%안 적어도 돌아감 'ClassNames',{'setosa','versicolor','virginica'}, 'DiscrimType','linear', 'Prior',prior);

rng(0);
cp = cvpartition(Y_tv,'KFold',10);

cvlda = crossval(lda_Model,'CVPartition',cp);
ldaCVErr = kfoldLoss(cvlda)


label_tv = predict(lda_Model,X_tv); 

figure;
confusionchart(Y_tv,label_tv);

%
label_ts = predict(lda_Model,X_ts); 

figure;
confusionchart(Y_ts,label_ts);
%%
% LDA 시각화 1
figure;
gscatter(meas(:,3), meas(:,4), species,'rgb','osd'); hold on;
xlabel('Petal length');
ylabel('Petal width');

bad = ~strcmp(label_ts,Y_ts);
good = strcmp(label_ts,Y_ts);

plot(X_ts(bad,1), X_ts(bad,2), 'kx'); hold on;
plot(X_ts(good,1), X_ts(good,2), 'ko'); hold off;

%%
% LDA 시각화 2
%영역을 어떻게 나누었는지
[x,y] = meshgrid(0.5:.1:8,0:.1:3);
x = x(:);
y = y(:);
j = predict(lda_Model, [x y]);

figure;
gscatter(x,y,j,'rgb','sod');



%% QDA
cov(X_tv(1:45,1:2)) % setosa
cov(X_tv(46:90,1:2)) % versicolor
cov(X_tv(91:135,1:2)) % virginica

prior = [0.3333 0.3333 0.3333];
qda_Model = fitcdiscr(X_tv,Y_tv,'ClassNames',{'setosa','versicolor','virginica'}, 'DiscrimType','quadratic', 'Prior',prior);

rng(0);
cp = cvpartition(Y_tv,'KFold',10)

cvlda = crossval(qda_Model,'CVPartition',cp);
ldaCVErr = kfoldLoss(cvlda)


label_tv = predict(qda_Model,X_tv); 

figure;
confusionchart(Y_tv,label_tv);


label_ts = predict(qda_Model,X_ts); 

figure;
confusionchart(Y_ts,label_ts);


% QDA 시각화 1
figure;
gscatter(meas(:,3), meas(:,4), species,'rgb','osd'); hold on;
xlabel('Petal length');
ylabel('Petal width');

bad = ~strcmp(label_ts,Y_ts);
good = strcmp(label_ts,Y_ts);

plot(X_ts(bad,1), X_ts(bad,2), 'kx'); hold on;
plot(X_ts(good,1), X_ts(good,2), 'ko'); hold off;

% QDA 시각화 2
[x,y] = meshgrid(0.5:.1:8,0:.1:3);
x = x(:);
y = y(:);
j = predict(qda_Model, [x y]);

figure;
gscatter(x,y,j,'rbg','sod');

