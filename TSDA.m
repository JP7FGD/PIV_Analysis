% To analyse spatial average velocity data
% Sujoy 07/2018

%% load data

filename = ['I:\PIV_OUT\still\mean\s\PIV_still_smeanv_50.mat'];
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

DataCount = length(filtered_VD);
MaxT = DataCount/Fs;
TimeLine = 0:1/Fs:MaxT-(1/Fs);


%% PS
nfft = 16384;
[pxxf, ff] = pwelch(filtered_VD,kaiser(nfft,0.5),[],nfft,Fs,'power');



%%

 scrsz=get(groot,'ScreenSize');
 figure('Position', [1 scrsz(2)/3 scrsz(3)/2 scrsz(4)/2]);
plot(TimeLine,filtered_VD,'-k');
%plot(TimeLine,filtered_VD,'-', 'color', [1 0.5 0]);
%plot(TimeLine,filtered_VD,'-', 'color', [0.6 0.6 0.5]);
%plot(TimeLine,filtered_VD,'-', 'color', [0.3 0.6 0.7]);
daspect([2.5 1 8])
%loglog(ff,pxxf,'-r')
ax = gca;
    %ax.XLim = [30 300];
    ax.YLim = [-0.36 -0.08];
     ax.XTickMode = 'manual';
     ax.YTickMode = 'manual';
     xtickformat('%.2f')
     ytickformat('%.2f')
     ax.XTick = 0:0.2:1;
     ax.YTick = -0.4:0.05:0;
    ax.FontSize = 24;
    ax.FontName =  'Times New Roman';
    ax.TitleFontSizeMultiplier = 2;
    xlabel('\it \fontname{Times New Roman}t \rm[sec]');
    ylabel('\it \fontname{Times New Roman}velocity  \rm[m/s]');
    legend('120Hz','Location','SouthEast');