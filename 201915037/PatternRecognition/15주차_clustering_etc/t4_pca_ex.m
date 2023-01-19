
clear all; close all; clc;

load fisheriris;

figure;
gscatter(meas(:,1), meas(:,2), species,'rgb','osd');
xlabel('Sepal length');
ylabel('Sepal width');
N = size(meas,1);


figure;
gscatter(meas(:,3), meas(:,4), species,'rgb','osd');
xlabel('Pepal length');
ylabel('Pepal width');
N = size(meas,1);

% 4개의 특징을 사용
set_data = meas;

% 공분산
c_mat = cov(set_data)

% 고유값, 고유벡터
[V,D] = eig(c_mat)

[coeff, SCORE, latent, tsquared, explained, mu]  =  pca(set_data);

% PCA 후 2개 지표 그려보기
figure;
gscatter(SCORE(:,1), SCORE(:,2), species,'rgb','.');

out = (set_data*coeff)

figure;
gscatter(out(:,1), out(:,2), species,'rgb','osd');

%%
mdl = fitctree(set_data, species,'PredictorNames',{'SL' 'SW' 'PL' 'PW'});
view(mdl,'Mode','graph');

% 최적 leaf 찾기
resubcost = resubLoss(mdl,'Subtrees','all');
[cost,secost,ntermnodes,bestlevel] = cvloss(mdl,'Subtrees','all');

% 가지치기
pt = prune(mdl,'Level',bestlevel);
view(pt,'Mode','graph')

% 성능평가

est_label = predict(pt,set_data);
figure;
confusionchart(species,est_label);



%%
[coeff, SCORE, latent, tsquared, explained, mu]  =  pca(set_data);

pca_data = [];
pca_data = [SCORE(:,1) SCORE(:,2)];

mdl2 = fitctree(pca_data, species,'PredictorNames',{'PC1' 'PC2'});

view(mdl2,'Mode','graph');

% 최적 leaf 찾기
resubcost = resubLoss(mdl2,'Subtrees','all');
[cost,secost,ntermnodes,bestlevel] = cvloss(mdl2,'Subtrees','all');

% 가지치기
pt2 = prune(mdl2,'Level',bestlevel);
view(pt2,'Mode','graph')

% 성능평가
est_label = predict(pt2,pca_data);

figure;
confusionchart(species,est_label);

