clear all; close all; clc;

TR_SET = [];
TR_LABEL = [];

[b, a] = butter(5, 0.0001/((1/30)/2),'low');
for subj = 1:1:4
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/14주차_svm_sleep/Subject' num2str(subj)];
    cd(folder_name);
    
    load TimeDomainHRV; % 4
    load FrequencyDomainHRV; % 6/7;
    ref_stg = stg;
    ref_stg(1:9) = [];

    R_NR_stg = ones(length(ref_stg), 1);
    idx = find(ref_stg == 4);
    R_NR_stg(idx, 1) = 2;


    TMP_HRV   = zeros(length(R_NR_stg), 10);
    TMP_LABEL = R_NR_stg;

    
    TMP_HRV(:, 1) = (M_HR(10:end)');
    TMP_HRV(:, 2) = (SDNN(10:end)');
    TMP_HRV(:, 3) = (RMSSD(10:end)');
    TMP_HRV(:, 4) = (pNN50(10:end)');
    TMP_HRV(:, 5) = (HF(10:end)');
    TMP_HRV(:, 6) = (LF(10:end)');
    TMP_HRV(:, 7) = (TF(10:end)');
    TMP_HRV(:, 8) = (nHF(10:end)');
    TMP_HRV(:, 9) = (nLF(10:end)');
    TMP_HRV(:, 10) = (VLF(10:end)');


    for k=1:1:10
        TMP_HRV(:, k) = filtfilt(b, a, TMP_HRV(:, k));   
        TMP_HRV(:, k) = TMP_HRV(:, k)- filtfilt(b, a, TMP_HRV(:, k));     
        TMP_HRV(:, k) = smooth(TMP_HRV(:, k), 35, 'moving');
        TMP_HRV(:, k) = (TMP_HRV(:, k) - mean(TMP_HRV(:, k)))/std(TMP_HRV(:, k));
    end

    TR_SET = [TR_SET; TMP_HRV];
    TR_LABEL = [TR_LABEL; TMP_LABEL];
end

%%
TS_SET = [];
TS_LABEL = [];
for subj = 5
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/14주차_svm_sleep/Subject' num2str(subj)];
    cd(folder_name);
    
    load TimeDomainHRV; % 4
    load FrequencyDomainHRV; % 6/7;

    ref_stg = stg;
    ref_stg(1:9) = [];

    R_NR_stg = ones(length(ref_stg), 1);
    idx = find(ref_stg == 4);

    R_NR_stg(idx, 1) = 2;

    TMP_HRV   = zeros(length(R_NR_stg), 10);
    TMP_LABEL = R_NR_stg;

     % 앞에 9개 제거 특징벡터를 만듦
    TMP_HRV(:, 1) = (M_HR(10:end)');
    TMP_HRV(:, 2) = (SDNN(10:end)');
    TMP_HRV(:, 3) = (RMSSD(10:end)');
    TMP_HRV(:, 4) = (pNN50(10:end)');
    TMP_HRV(:, 5) = (HF(10:end)');
    TMP_HRV(:, 6) = (LF(10:end)');
    TMP_HRV(:, 7) = (TF(10:end)');
    TMP_HRV(:, 8) = (nHF(10:end)');
    TMP_HRV(:, 9) = (nLF(10:end)');
    TMP_HRV(:, 10) = (VLF(10:end)');

    % 필터링 & 스무딩 & 정규화
    for k=1:1:10
%         TMP_HRV(:, k) = filtfilt(b, a, TMP_HRV(:, k)); 
        TMP_HRV(:, k) = TMP_HRV(:, k)- filtfilt(b, a, TMP_HRV(:, k));     
        TMP_HRV(:, k) = smooth(TMP_HRV(:, k),35, 'moving'); 
        TMP_HRV(:, k) = (TMP_HRV(:, k) - mean(TMP_HRV(:, k)))/std(TMP_HRV(:, k));
    end

    TS_SET = [TS_SET; TMP_HRV];
    TS_LABEL = [TS_LABEL; TMP_LABEL];
end
%%

rng(1);
SVMModel = fitcsvm(TR_SET, TR_LABEL,'KernelFunction', 'linear');



cp = cvpartition(TR_LABEL,'KFold',10);
cvSVM = crossval(SVMModel,'CVPartition',cp);
SVMCVErr = kfoldLoss(cvSVM)

% 학습한 데이터를 모델에 넣고 재평가
label = predict(SVMModel,TR_SET);

[result, table]=multi_kappa(TR_LABEL, label, [1, 2])

figure;
subplot(211); bar(label); axis tight; title('est');
subplot(212); bar(TR_LABEL); axis tight; title('ref');

label = predict(SVMModel,TS_SET);

[result, table]=multi_kappa(TS_LABEL, label, [1, 2])

figure;
subplot(211); bar(label); axis tight; title('est');
subplot(212); bar(TS_LABEL); axis tight; title('ref');

%% 과연 10개의 지표를 모두 사용하는 것이 좋은가? 
% 5개만 선택해보자 10C5
ID = nchoosek(1:1:10, 8);
SVMCVErr = zeros(length(ID), 1);

for k=1:1:length(ID)
    k
    SVMModel = fitcsvm(TR_SET(:,ID(k,:)), TR_LABEL,'KernelFunction', 'linear');

    label = predict(SVMModel,TR_SET(:,ID(k,:)));
    [result, table]=multi_kappa(TR_LABEL, label, [1, 2]);
    SVMCVErr(k,1) = result.kappa;
end

figure; plot(SVMCVErr);

[mv, mi] = min(SVMCVErr);

label = predict(SVMModel,TR_SET(:,ID(mi,:)));

[result, table]=multi_kappa(TR_LABEL, label, [1, 2])

figure;
subplot(211); bar(label); axis tight;
subplot(212); bar(TR_LABEL); axis tight;

label = predict(SVMModel,TS_SET(:,ID(mi,:)));

[result, table]=multi_kappa(TS_LABEL, label, [1, 2])

figure;
subplot(211); bar(label); axis tight;
subplot(212); bar(TS_LABEL); axis tight;

% data smoothing을 조정했습니다. 
% docment에서 span 값을 홀수 값으로 하는 것이 이상적이라해서 홀수 값 3,31,35,43,73,100 로 변화를 주며 kappa, agreement,accuracy 가 최적의 성능이 되는
%점을 찾아 보려 했으며 그중 가장 좋은 성능을 보인 35로 정했습니다.이후 10개의 지표중 3,5,8,9 최적의 갯수를 찾아보았으며
% 3을 제외한 모든 지표들은 비슷했습니다. 하지만 그중에서 accuracy와 kappa 값이 가장 좋은 8개 였습니다. 그래서 저는
% 8개가 가장 최적의 갯수라고 생각합니다.
%\