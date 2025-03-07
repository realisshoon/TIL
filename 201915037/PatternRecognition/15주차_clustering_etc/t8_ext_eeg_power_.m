clear all; close all; clc;


for subj = 1:1:5

    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/15주차_clustering_etc/Subject' num2str(subj)];
    cd(folder_name);

    load EEGdata;

    %% 기본 필터링
    % 0.5Hz IIR HPF
    [b, a] = butter(5, 0.5/(Fs/2), 'high');
    fdata = filtfilt(b, a, data);

    % 35Hz IIR LPF
    [b, a] = butter(5, 35/(Fs/2), 'low');
    fdata = filtfilt(b, a, fdata);

    ALPHA = [];
    THETA = [];
    DELTA = [];
    SWA = [];

    for k=1:1:length(stg)
        [subj k]

        %샘플링 주파수가 250Hz이므로, 30초 데이터는 250Hz*30초 = 7500개
        % 1~7500, 7501~15000, 15001~22500, ... 와 같이 데이터를 불러오면 됨
        tmpdata = fdata( (k-1)*Fs*30 + 1 : k*Fs*30);

        % 주파수 변환
        [pxx, f] = periodogram(tmpdata, [], length(tmpdata), Fs);

        % 대역 주파수 찾기
        idx_alpha = find(f >= 8 & f <= 13); % 알파파 대역
        idx_theta = find(f >= 4 & f <= 7); % 세타파 대역
        idx_delta = find(f >= 0.5 & f <= 4); % 델타파 대역
        idx_swa   = find(f >= 0.5 & f <= 2); % slow wave activity 대역

        % 주파수 대역 "비율" 계산
        % 사람마다 뇌전도의 파워는 다를 것이므로 해당구간의 전체 파워로 나눠줌
        ALPHA(k,1) = sum(pxx(idx_alpha)) / (sum(pxx));
        THETA(k,1) = sum(pxx(idx_theta)) / (sum(pxx));
        DELTA(k,1) = sum(pxx(idx_delta)) / (sum(pxx));
        SWA(k,1) = sum(pxx(idx_swa)) / (sum(pxx));
    end

    save EEG_BAND_POWER ALPHA THETA DELTA SWA stg;
end

%%
figure;
subplot(511); plot(ALPHA); hold on; plot(smooth(ALPHA, 100, 'moving')); axis tight;
subplot(512); plot(THETA); hold on; plot(smooth(THETA, 100, 'moving')); axis tight;
subplot(513); plot(DELTA); hold on; plot(smooth(DELTA, 100, 'moving')); axis tight;
subplot(514); plot(SWA); hold on; plot(smooth(SWA, 100, 'moving')); axis tight;
subplot(515); plot(stg); axis tight;
