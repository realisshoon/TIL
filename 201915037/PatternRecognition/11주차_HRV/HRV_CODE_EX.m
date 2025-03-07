clear all; close all; clc;

for subj = 1:1:5
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/11주차_HRV/Subject' num2str(subj)];
    cd(folder_name);
    
    load ECG_PEAK;
    
    SDNN   = zeros(1, length(stg));
    RMSSD  = zeros(1, length(stg));
    pNN50  = zeros(1, length(stg));
    M_HR   = zeros(1, length(stg));
    for k=1:1:length(stg)
        [subj k]
        % 30초에 해당하는 심박 위치를 불러옴 
        idx     = find(ECG_PEAK > (k-1)*Fs*30+1 & ECG_PEAK <= (k)*Fs*30);
        local_rpeak = ECG_PEAK(idx);
        
        % 시간영역 심박변이율 지표를 계산
        [SDNN(k), RMSSD(k), pNN50(k), M_HR(k)]  =  SM_TD_HRV(Fs, local_rpeak);
    end
    
    save TimeDomainHRV SDNN RMSSD pNN50 M_HR stg;
     
end

%%
clear all; close all; clc;

for subj = 1:1:5
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/11주차_HRV/Subject' num2str(subj)];
    cd(folder_name);
    
    load ECG_PEAK;
    
    LF    = zeros(1, length(stg));
    HF    = zeros(1, length(stg));
    TF    = zeros(1, length(stg));
    VLF   = zeros(1, length(stg));
    nLF   = zeros(1, length(stg));
    nHF   = zeros(1, length(stg));
    LFHF  = zeros(1, length(stg));
    
    for k=1:1:length(stg) - 9
        [subj k]
        % 30초에 해당하는 심박 위치를 불러옴 
        idx     = find(ECG_PEAK > (k-1)*Fs*30+1 & ECG_PEAK <= (k+9)*Fs*30);
        local_rpeak = ECG_PEAK(idx);
        
        % 시간영역 심박변이율 지표를 계산
        [LF(k+9), HF(k+9), TF(k+9), VLF(k+9), nLF(k+9), nHF(k+9), LFHF(k+9)]  =  SM_FD_HRV(Fs, local_rpeak);
    end
    
    save FrequencyDomainHRV LF HF TF VLF nLF nHF LFHF stg;
     
end

