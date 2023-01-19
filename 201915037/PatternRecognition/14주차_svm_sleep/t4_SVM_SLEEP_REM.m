clear all; close all; clc;

TR_SET = [];
TR_LABEL = [];

[b, a] = butter(5, 0.0001/((1/30)/2),'low');
% [b, a] = butter(5, 0.0001/((1/30)/2),'high');
for subj = 1:1:4
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/14주차_svm_sleep/Subject' num2str(subj)];
    cd(folder_name);
    
    load TimeDomainHRV; % 4
    load FrequencyDomainHRV; % 6/7;

    % 주파수영역 HRV에서 300초, 30초 shift로 값을 계산했으므로 9개는 계산을 못함
    % 정답제거
    ref_stg = stg;
    ref_stg(1:9) = [];

    % REM과 NREM을 각각 2, 1로 구분
    R_NR_stg = ones(length(ref_stg), 1);
    idx = find(ref_stg == 4);
    R_NR_stg(idx, 1) = 2;

    % 특징벡터 만들기
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

    % 필터링 & 스무딩 & 정규화
    %1.저주파 성분만 제거
    %2.스무딩
    %3.정규화
    for k=1:1:10
%         TMP_HRV(:, k) = filtfilt(b, a, TMP_HRV(:, k));   
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
% 커널을 조절해보자
% Prior를 조절해보자 사전확률
% SVMModel = fitcsvm(TR_SET, TR_LABEL,'KernelFunction', 'linear','Prior',[0.8,0.2]);
rng(1);
SVMModel = fitcsvm(TR_SET, TR_LABEL,'KernelFunction', 'linear');
% 가우시안 TR은 overfitting 돼서 TS는 성능이 안 좋음
% SVMModel = fitcsvm(TR_SET, TR_LABEL,'KernelFunction', 'rbf');



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
%     % cross validation
%     cp = cvpartition(TR_LABEL,'KFold',5);
%     cvSVM = crossval(SVMModel,'CVPartition',cp);
%     SVMCVErr(k,1) = kfoldLoss(cvSVM);
    % 재대입 kappa 성능
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

%
%8가 최적의 조합이라고 생각합니다. 
%test data에서 가장 성능이 좋은 것은 무엇? 
