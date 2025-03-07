clear all; close all; clc;

cd '/Users/iamseungman/Documents/MATLAB/13주차_nb_da'

%총 8개 데이터 (부정맥, 정상) 부정맥: ~1177 
load TR_SET;
TR_DATA_SET = [];
TR_DATA_SET = [tr_M_HR_af tr_RMSSD_af tr_SDNN_af tr_min_RRI_af; tr_M_HR_n tr_RMSSD_n tr_SDNN_n tr_min_RRI_n];
TR_LABEL    = [];

TR_LABEL    = [2*ones(length(tr_M_HR_af), 1); ones(length(tr_M_HR_n), 1)];

%2:부정맥 1:정상
load TS_SET;
TS_DATA_SET = [];
TS_DATA_SET = [ts_M_HR_af ts_RMSSD_af ts_SDNN_af ts_min_RRI_af; ts_M_HR_n ts_RMSSD_n ts_SDNN_n ts_min_RRI_n];
TS_LABEL    = [];
TS_LABEL    = [2*ones(length(ts_M_HR_af), 1); ones(length(ts_M_HR_n), 1)];

% figure;
% plot(tr_SDNN_af,tr_min_RRI_af,'ro'); hold on;
% plot(tr_RMSSD_n,tr_min_RRI_n,'kx'); hold on;


%%
Dist={};
Dist={'cityblock','cosine','euclidean','correlation'};
cnt=1;
kj_set=[];
acc_set=[];
%k계수 결정 유클리디안
for k=1:1:10
    for j=1:1:4
    % knn_Model = fitcknn(TR_DATA_SET, TR_LABEL,'NumNeighbors', k, ...
    %     'Distance', 'euclidean','ClassNames',[1, 2], 'Prior', prior, 'Standardize',1);
    knn_Model = fitcknn(TR_DATA_SET, TR_LABEL,'NumNeighbors', k, ...
        'Distance', Dist{j},'ClassNames',[1, 2], 'Standardize',1);
    
    % 10fold 교차 검증
    rng(1);
    cp = cvpartition(TR_LABEL,'KFold',10);
    
    cv_knn = crossval(knn_Model,'CVPartition',cp);
    knnCVErr(cnt,1) = kfoldLoss(cv_knn)
    kj_set(cnt,1)=k;
    kj_set(cnt,2)=j;

    label_tr = predict(knn_Model,TR_DATA_SET);
%     [result,table]=multi_kappa(TR_LABEL,label_tr,[1,2]);
%     acc_set(cnt,1)=result.agree; %목적함수 max accuracy 
    cnt=cnt+1;
    end
end

[mv,mi]=min(knnCVErr)

figure;
confusionchart(TR_LABEL,label_tr);

label_ts = predict(knn_Model,TS_DATA_SET); 

figure;
confusionchart(TS_LABEL,label_ts);



%%

rng(1)
Mdl_knn_auto = fitcknn(TS_DATA_SET, TS_LABEL,'OptimizeHyperparameters','auto', ...
              'HyperparameterOptimizationOptions', ...
                struct('maxObjectiveEvaluations','bayesopt', 'Kfold',10 )) % , 'Kfold',10 (default: 5)

cp = cvpartition(TS_LABEL,'KFold',10);

cv_knn_auto = crossval(Mdl_knn_auto,'CVPartition',cp);
nbCVErr = kfoldLoss(cv_knn_auto)

label_tr = predict(Mdl_knn_auto,TR_DATA_SET); 

figure;
confusionchart(TR_LABEL,label_tr);

%
label_ts = predict(Mdl_knn_auto,TS_DATA_SET); 

figure;
confusionchart(TS_LABEL,label_ts);
