% To analyse spatial average velocity data
% Sujoy 07/2018

%% load data

filename = ['I:\PIV_OUT\still\mean\s\PIV_still_smeanv_60.mat'];
load(filename);

%numArrays = 9;
% TSD = cell(numArrays,1);
% for n = 1:numArrays
%     FileName = ['I:/ch0618/PM/chem_' num2str(FileIndex(n)) '_mean_3.mat']; % need to change 
%     BI{n} = load(FileName);
% end


%% filter/smoth

Fs = 20e3;
windowSize = 20; 
b = (1/windowSize)*ones(1,windowSize);
a = 1;
filtered_VD = filtfilt(b,a,MeanVelocity);

%% PS
nfft = 16384;
[pxxf, ff] = pwelch(filtered,kaiser(nfft,0.5),[],nfft,Fs,'power');