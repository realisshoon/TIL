%%
clear all; close all; clc;

%training data 
TR_SET = [];
TR_LABEL = [];
for subj = 1:1:4
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/14주차_svm_sleep/Subject' num2str(subj)];
    cd(folder_name);
    
    load TimeDomainHRV; % 4
    load FrequencyDomainHRV; % 6/7;

    % 주파수영역 HRV에서 300초, 30초 shift로 값을 계산했으므로 초기 9개는 계산을 못함
    % 정답 초기 9개 제거
    ref_stg = stg;
    ref_stg(1:9) = [];

    % REM과 NREM을 각각 2, 1로 레이블링
    R_NR_stg = ones(length(ref_stg), 1);
    idx = find(ref_stg == 4);
    R_NR_stg(idx, 1) = 2;

    % 특징벡터 만들기
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

    TR_SET = [TR_SET; TMP_HRV];
    TR_LABEL = [TR_LABEL; TMP_LABEL];
end

%%
%test data
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

    TS_SET = [TS_SET; TMP_HRV];
    TS_LABEL = [TS_LABEL; TMP_LABEL];
end
%%
%svm
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

%%
label = predict(SVMModel,TS_SET);

[result, table]=multi_kappa(TS_LABEL, label, [1, 2])

figure;
subplot(211); bar(label); axis tight; title('est');
subplot(212); bar(TS_LABEL); axis tight; title('ref');


