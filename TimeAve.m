% 20180529 Sujoy
% just to obtain a mean image
% now only do one file at a time, want to make it do all the files at one run
% require loaddat.m to run

%Initialize
close all; clear MeanImage Mean_Velocity;


%Set parameters
X_Pixels = 120;
Y_Pixels = 120;
Number_Image = 2000; %Total # of image per file
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image
BatchSize = 1; % # of image to process @one time determine based on memory size
N = [X_Pixels Y_Pixels BatchSize]; % structure of input data
BatchCount = Number_Image/BatchSize; % number of division per file
Number_File = 1; % # of file to analyze
cut_X = 5:120;% recalculate
cut_Y = 1:105;%

%prepare output matrix
Part_MeanImage = zeros(size(cut_Y,2),size(cut_X,2),BatchCount); % change based on the cut
MeanImage = zeros(size(cut_Y,2),size(cut_X,2),Number_File);
%Max_Image = zeros(1,Number_File); % need some thinking
Max_Velocity = zeros(1,2000);

% input file
file = 'I:/PIV_OUT/still/o-01v_%01u.dat'; 

for n=1:Number_File  %temp make another loop with 
    filename = sprintf(file,n);
%main loop consider to use function hundle and clear the memory
    for j = 1:BatchCount

        Image = reshape(loaddat(filename,(j-1)*BatchSize*Pixels*8,Pixels*BatchSize),[Y_Pixels,X_Pixels,BatchSize]); %load the image
        RawImage = permute(Image(cut_X(1,:),cut_Y(1,:),:),[2 1 3]); %permute
        %RawImage = permute(Image(cut_X(1,:),cut_Y(1,:),:),[2 1]); %permute
        %CutImage = RawImage (cut_Y(1,:),cut_X(1,:),:); % cut the image if needed better combine with upper line
        Part_MeanImage(:,:,j) = mean(RawImage,3); %obtain a partial mean image
        %Part_MeanImage(:,:,j) = RawImage;
       % Max_Velocity(1,j) = max(max(Image));
        %Max_Velocity(1,j) = max(max(Part_MeanImage(:,:,j)));
    end
    MeanImage(:,:,n) = mean(Part_MeanImage,3); 
    %Max_Image(1,n) = max(max(MeanImage(:,:,n)));
    %[M, I] = max(Max_Velocity);
end
Mean_Velocity = mean(MeanImage,3);

%finish up
FileName = ['I:\PIV_OUT\still\mean\full\PIV_still_meanv_50_t3.mat']; % output file name
save(FileName,'Mean_Velocity'); 

%normalization
%[Max_Value, I] = max(Max_Image); % find the index
%Nor_mean = MeanImage/Max_Value; 
%FileName = ['I:\ch0618\output\chem_nor_mean_2.mat']; % output file name
%save(FileName,'Nor_mean'); 


