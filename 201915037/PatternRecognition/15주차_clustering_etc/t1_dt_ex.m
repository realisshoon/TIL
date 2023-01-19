%%
clear all; close all; clc;

load fisheriris;

% 데이터 분리. Sepal length width 만 사용 예정
rng(1)
% 각 그룹의 20%를 추출
[~, ~, ts_idx1] = dividerand(1:1:50, 0.8, 0, 0.2);
[~, ~, ts_idx2] = dividerand(51:1:100, 0.8, 0, 0.2);
[~, ~, ts_idx3] = dividerand(101:1:150, 0.8, 0, 0.2);

ts_id = [];
ts_id = [ts_idx1 ts_idx2 ts_idx3];

tr_data = meas(:,1:2);
tr_label = species;

tr_data(ts_id,:) =[];
tr_label(ts_id,:) =[];

ts_data = meas(ts_id,1:2);
ts_label = species(ts_id,:);

%특징그려보기
figure;
gscatter(tr_data(:,1), tr_data(:,2), tr_label,'grb','sod');

% decision tree를 이용하여 붓꽃 종을 분류하는 모델을 만듦
mdl = fitctree(tr_data, tr_label,'PredictorNames',{'SL' 'SW' });

% 그림그려보기
[x,y] = meshgrid(4:.1:8,2:.1:4.5);
x = x(:);
y = y(:);

[grpname,node] = predict(mdl,[x y]);
figure;
gscatter(x,y,grpname,'rgb','osd');

% 모델이 어떻게 만들어졌는지 보기
view(mdl,'Mode','graph');

cp = cvpartition(tr_label,'KFold',10);
cvt = crossval(mdl,'CVPartition',cp);
dtCVErr = kfoldLoss(cvt)

% 최적 leaf 찾기
resubcost = resubLoss(mdl,'Subtrees','all');
[cost,secost,ntermnodes,bestlevel] = cvloss(mdl,'Subtrees','all');
plot(ntermnodes,cost,'b-', ntermnodes,resubcost,'r--')
figure(gcf);
xlabel('Number of terminal nodes');
ylabel('Cost (misclassification error)')
legend('Cross-validation','Resubstitution')

[mincost,minloc] = min(cost);
cutoff = mincost + secost(minloc);
hold on
plot([0 20], [cutoff cutoff], 'k:')
plot(ntermnodes(bestlevel+1), cost(bestlevel+1), 'mo')
legend('Cross-validation','Resubstitution','Min + 1 std. err.','Best choice')
hold off

% 가지치기
pt = prune(mdl,'Level',bestlevel);
view(pt,'Mode','graph')

% 성능평가
est_label = predict(pt,ts_data);

figure;
confusionchart(ts_label,est_label);

est_label = predict(mdl,ts_data);

figure;
confusionchart(ts_label,est_label);

%% random forest 일부예시
Mdl = TreeBagger(50,tr_data,tr_label,'OOBPrediction','On','Method','classification'); 
view(Mdl.Trees{1},'Mode','graph')

figure;
oobErrorBaggedEnsemble = oobError(Mdl);
plot(oobErrorBaggedEnsemble)
xlabel 'Number of grown trees';
ylabel 'Out-of-bag classification error';

label = predict(Mdl, ts_data)

figure;
confusionchart(ts_label,label);