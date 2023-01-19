clear all; close all; clc;

TR_SLEEP_EEG = [];
TR_LABEL = [];

for subj = 1:1:4
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/15주차_clustering_etc/Subject' num2str(subj)];
    cd(folder_name);

    load SLEEP_EEG_POWER.mat;

    %대역 뇌파 별로 평균과 표준편차를 계산
    alpha_set = ([EEG_alpha_light; EEG_alpha_deep; EEG_alpha_wake; EEG_alpha_REM]);
    theta_set = ([EEG_theta_light; EEG_theta_deep; EEG_theta_wake; EEG_theta_REM]);
    delta_set = ([EEG_delta_light; EEG_delta_deep; EEG_delta_wake; EEG_delta_REM]);
    swa_set = ([EEG_swa_light; EEG_swa_deep; EEG_swa_wake; EEG_swa_REM]);

    ma_ = mean(alpha_set);
    mt_ = mean(theta_set);
    md_ = mean(delta_set);
    ms_ = mean(swa_set);

    sa_ = std(alpha_set);
    st_ = std(theta_set);
    sd_ = std(delta_set);
    ss_ = std(swa_set);
    
    % 정규화  ( x-mean(x) ) / std(x)
    tmp_light = [];
    tmp_light = [((EEG_alpha_light - ma_)./sa_) ((EEG_theta_light - mt_)./st_) ((EEG_delta_light - md_)./sd_) ((EEG_swa_light - ms_)./ss_)];

    tmp_deep = [];
    tmp_deep = [((EEG_alpha_deep - ma_)./sa_) ((EEG_theta_deep - mt_)./st_) ((EEG_delta_deep - md_)./sd_) ((EEG_swa_deep - ms_)./ss_)];

    tmp_wake = [];
    tmp_wake = [((EEG_alpha_wake - ma_)./sa_) ((EEG_theta_wake - mt_)./st_) ((EEG_delta_wake - md_)./sd_) ((EEG_swa_wake - ms_)./ss_)];

    tmp_rem = [];
    tmp_rem = [((EEG_alpha_REM - ma_)./sa_) ((EEG_theta_REM - mt_)./st_) ((EEG_delta_REM - md_)./sd_) ((EEG_swa_REM - ms_)./ss_)];

    TR_SLEEP_EEG = [TR_SLEEP_EEG; tmp_wake; tmp_light; tmp_rem; tmp_deep;];

    
    len_NSWS = length(tmp_wake)+length(tmp_light)+length(tmp_rem);
    len_SWS = length(tmp_deep);

    TR_LABEL = [TR_LABEL; ones(len_NSWS, 1); 2*ones(len_SWS, 1)];
    
end

TS_SLEEP_EEG = [];
TS_LABEL = [];

for subj = 5
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/15주차_clustering_etc/Subject' num2str(subj)];
    cd(folder_name);

    load SLEEP_EEG_POWER.mat;

    %대역 뇌파 별로 평균과 표준편차를 계산
    alpha_set = ([EEG_alpha_light; EEG_alpha_deep; EEG_alpha_wake; EEG_alpha_REM]);
    theta_set = ([EEG_theta_light; EEG_theta_deep; EEG_theta_wake; EEG_theta_REM]);
    delta_set = ([EEG_delta_light; EEG_delta_deep; EEG_delta_wake; EEG_delta_REM]);
    swa_set = ([EEG_swa_light; EEG_swa_deep; EEG_swa_wake; EEG_swa_REM]);

    ma_ = mean(alpha_set);
    mt_ = mean(theta_set);
    md_ = mean(delta_set);
    ms_ = mean(swa_set);

    sa_ = std(alpha_set);
    st_ = std(theta_set);
    sd_ = std(delta_set);
    ss_ = std(swa_set);
    
    % 정규화  ( x-mean(x) ) / std(x)
    tmp_light = [];
    tmp_light = [((EEG_alpha_light - ma_)./sa_) ((EEG_theta_light - mt_)./st_) ((EEG_delta_light - md_)./sd_) ((EEG_swa_light - ms_)./ss_)];

    tmp_deep = [];
    tmp_deep = [((EEG_alpha_deep - ma_)./sa_) ((EEG_theta_deep - mt_)./st_) ((EEG_delta_deep - md_)./sd_) ((EEG_swa_deep - ms_)./ss_)];

    tmp_wake = [];
    tmp_wake = [((EEG_alpha_wake - ma_)./sa_) ((EEG_theta_wake - mt_)./st_) ((EEG_delta_wake - md_)./sd_) ((EEG_swa_wake - ms_)./ss_)];

    tmp_rem = [];
    tmp_rem = [((EEG_alpha_REM - ma_)./sa_) ((EEG_theta_REM - mt_)./st_) ((EEG_delta_REM - md_)./sd_) ((EEG_swa_REM - ms_)./ss_)];

    TS_SLEEP_EEG = [TS_SLEEP_EEG; tmp_wake; tmp_light; tmp_rem; tmp_deep;];

    
    len_NSWS = length(tmp_wake)+length(tmp_light)+length(tmp_rem);
    len_SWS = length(tmp_deep);

    TS_LABEL = [TS_LABEL; ones(len_NSWS, 1); 2*ones(len_SWS, 1)];
    
end
%%
rng(1);
mdl = fitctree(TR_SLEEP_EEG, TR_LABEL);
view(mdl,'Mode','graph');

% 최적 leaf 찾기
resubcost = resubLoss(mdl,'Subtrees','all');
[cost,secost,ntermnodes,bestlevel] = cvloss(mdl,'Subtrees','all');

% 가지치기
pt = prune(mdl,'Level',bestlevel);
view(pt,'Mode','graph')

est_label = predict(pt,TR_SLEEP_EEG);
[result, table]=multi_kappa(TR_LABEL, est_label, [1, 2])

figure;
subplot(211); bar(est_label); axis tight;
subplot(212); bar(TR_LABEL); axis tight;

ts_est_label1 = predict(mdl,TS_SLEEP_EEG);
[result, table]=multi_kappa(TS_LABEL, ts_est_label1, [1, 2])

figure;
subplot(211); bar(ts_est_label1); axis tight;
subplot(212); bar(TS_LABEL); axis tight;

ts_est_label2 = predict(pt,TS_SLEEP_EEG);
[result, table]=multi_kappa(TS_LABEL, ts_est_label2, [1, 2])

figure;
subplot(211); bar(ts_est_label2); axis tight;
subplot(212); bar(TS_LABEL); axis tight;

