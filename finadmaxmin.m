%Normalize the Phasemean result
%temp made for one time use
%% Load result

FileIndex = [50 60 70 80 90 100 110 120]; % if off does not work use 0

 numArrays = 8;
 BI = cell(numArrays,1);
 for n = 1:numArrays
     FileName = ['G:/PIV_OUT/still/mean/full/PIV_still_meanv_' num2str(FileIndex(n)) '.mat']; % need to change 
     BI{n} = load(FileName);
 end

 %% find max value and index
 %Max_Value_Phase = zeros(1,32);
 Max_Value = zeros(1,n);
 Min_Value = zeros(1,n);
 %Index_Phase =zeros(1,n);
 for n = 1:numArrays
    Max_Value(n) = max(max(BI{n}.Mean_Velocity));
    Min_Value(n) = min(min(BI{n}.Mean_Velocity));
 end
 
 [Grand_Max, Index_Max] = max(Max_Value);
 [Grand_Min, Index_Min] = min(Min_Value);
 %FileName = ['I:\ch0618\PM\Index_Phase.mat']; % output file name
 %save(FileName,'Index_Phase'); 
 
