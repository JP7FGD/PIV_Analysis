% 20180711 Sujoy
% to obtain spatial average 
% only do one file at a time
% require loaddat.m to run

%Initialize
close all; clear MeanImage Mean_Velocity;


%Set parameters
X_Pixels = 120;
Y_Pixels = 120;
Number_Image = 2000; %Total # of image per file
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image
BatchSize = 2000; % # of image to process @one time determine based on memory size
N = [X_Pixels Y_Pixels BatchSize]; % structure of input data
BatchCount = Number_Image/BatchSize; % number of division per file
Number_File = 10; % # of file to analyze
cut_X = 32:112;% recalculate
cut_Y = 75:105;%

%prepare output matrix
Part_Mean = zeros(1,Number_Image); % change based on the cut
MeanVelocity = zeros(1,Number_Image*Number_File);
%Max_Image = zeros(1,Number_File); % need some thinking
%Max_Velocity = zeros(1,2000);

% input file
file = 'I:/PIV_OUT/still/o-08v_%01u.dat'; 
% filename = ['I:\PIV_OUT\still\PIV_still_v_50_3.mat'];
% load(filename);


for n=1:Number_File  %temp make another loop with 
    filename = sprintf(file,n);
%main loop consider to use function hundle and clear the memory
    for j = 1:BatchCount
        Image = reshape(loaddat(filename,(j-1)*BatchSize*Pixels*8,Pixels*BatchSize),[Y_Pixels,X_Pixels,BatchSize]); %load the image
        RawImage = permute(Image(cut_X(1,:),cut_Y(1,:),:),[2 1 3]); %permute
        Part_Mean = mean(mean(RawImage,1),2); %obtain a partial mean image
       % Max_Velocity(1,j) = max(max(Image));
    end
    MeanVelocity(1,2000*(n-1)+1:n*2000) = Part_Mean; 
    %Max_Image(1,n) = max(max(MeanImage(:,:,n)));
    %[M, I] = max(Max_Velocity);
end
%Mean_Velocity = mean(MeanImage,3);

%finish up
FileName = ['I:\PIV_OUT\still\mean\s\PIV_still_smeanv_120.mat']; % output file name
save(FileName,'MeanVelocity'); 