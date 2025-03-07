clear all; close all; clc;


subj = 5

folder_name = [];
folder_name = ['/Users/iamseungman/Documents/MATLAB/15주차_clustering_etc/Subject' num2str(subj)];
cd(folder_name);

load EEG_BAND_POWER;

%정규화
DELTA = (DELTA - mean(DELTA))./std(DELTA);
ALPHA = (ALPHA - mean(ALPHA))./std(ALPHA);

%주황색 선 (low filter) 조정
[b, a] = butter(5, 0.00002/((1/30)/2), 'low');
fDELTA = filtfilt(b, a, DELTA);
fALPHA = filtfilt(b, a, ALPHA);

%조정
figure;
subplot(311); plot(DELTA); hold on; plot(fDELTA+0.8*abs(fDELTA(1)-max(DELTA))); axis tight;
subplot(312); plot(ALPHA); hold on; plot(fALPHA-0.75*abs(fALPHA(1)-min(ALPHA))); axis tight;
subplot(313); plot(stg); axis tight;


%%
EST_SWS = ones(length(stg), 1);

tmp1 = zeros(length(stg), 1);
tmp2 = zeros(length(stg), 1);

%조정
idx1 = find( DELTA >= fDELTA+0.8*abs(fDELTA(1)-max(DELTA)) );
idx2 = find( ALPHA <= fALPHA-0.75*abs(fALPHA(1)-min(ALPHA)) );

tmp1(idx1,1) = 1;
tmp2(idx2,1) = 1;

idx3 = find(tmp1.*tmp2 == 1);
EST_SWS(idx3,1) = 2;

REF_STG = ones(length(stg), 1);
idx = find(stg == 1);
REF_STG(idx, 1) = 2;

[result, table]=multi_kappa(REF_STG, EST_SWS, [1, 2])

figure;
subplot(211); bar(EST_SWS); axis tight;
subplot(212); bar(REF_STG); axis tight;
