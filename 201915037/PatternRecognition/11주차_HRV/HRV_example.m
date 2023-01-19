clear all; close all; clc;


mHR_Wake =[];
mHR_Light =[];
mHR_Deep =[]; 
mHR_REM =[];

%%
for subj = 1:1:5
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/11주차_HRV/Subject' num2str(subj)];
    cd(folder_name);

    load TimeDomainHRV;
    len_loop=length(SDNN)/30;

    for k=1:1:len_loop
        k
        if stg(k)==1
            mHR_Deep=[mHR_Deep;M_HR];
        elseif stg(k)==2
            mHR_Light=[mHR_Light;M_HR];
        elseif stg(k)==3
            mHR_Wake=[mHR_Wake;M_HR];
        else
            mHR_REM=[mHR_REM;M_HR];
        end
    end
end
        
%%
LFHF_Deep=[];
LFHF_Light=[];
LFHF_Wake=[];
LFHF_REM=[];
%%
for subj = 1:1:5
    subj
    folder_name = [];
    folder_name = ['/Users/iamseungman/Documents/MATLAB/11주차_HRV/Subject' num2str(subj)];
    cd(folder_name);

    load FrequencyDomainHRV;

    refstg=stg;
    refstg(1:9)=[];

    LFHF(1:9)=[];
    
    if stg(k)==1
        LFHF_Deep=[LFHF_Deep;LFHF];
    elseif stg(k)==2
        LFHF_Light=[LFHF_Light;LFHF];
    elseif stg(k)==3
        LFHF_Wake=[LFHF_Wake;LFHF];
    else
        LFHF_REM=[LFHF_REM;LFHF];
    end
end
       
%%
sm_M_HR=smooth(M_HR,50,"moving"); %size에 따라 크기가변함 숫자를 낮추면 자글 높이면 평평하게

figure;
subplot(211); bar(M_HR);hold on; plot(sm_M_HR);axis tight;
subplot(212); bar(stg);axis tight;
yticks([1 2 3 4]);
yticklabels({'DS','LS','W','RS'});


% figure;
% subplot(211); plot(M_HR);hold on; plot(smooth(M_HR,50,"moving"));axis tight;
% subplot(212); plot(stg);axis tight;
sm_LHFH=smooth(LFHF,50,"moving");

figure;
subplot(211); bar(LFHF);hold on; plot(sm_LHFH);axis tight;
subplot(212); bar(stg);axis tight;
yticks([1 2 3 4]);
yticklabels({'DS','LS','W','RS'});



