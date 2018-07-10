%Code to convert .dat to .mat for movie.
%Sujoy  created 2018/06

%Initialize
close all; clear CutImage;

%Load Data 
file = 'I:/PIV_OUT/still/o-01v_%01u.dat';  %input file

%Set parameters
X_Pixels = 120; % Based on camera
Y_Pixels = 120;
Pixels = X_Pixels*Y_Pixels; % # of total pixels/image 
N = [X_Pixels Y_Pixels]; % structure of data
BatchSize = 1;
cut_Y = 1:105;
cut_X = 1:120;

%Generate needed matrix
I=zeros(Pixels,1,'double'); % Pre make the matrix to hold the image
%CutImage = zeros(size(cut_Y,2),size(cut_X,2),20000); % Pre make output matrix

%Set up loop parameters

s=1; % ID for store
%main loop
for l=1:10 % Each loop will proccess 2000 images 
    filename = sprintf(file,l);
    for n=1:2000
        Image = reshape(loaddat(filename,(l-1)*BatchSize*Pixels*2,Pixels*BatchSize),[Y_Pixels,X_Pixels,BatchSize]);
        RawImage = permute(Image(cut_X(1,:),cut_Y(1,:),:),[2 1 3]);
        if max(max(RawImage)) < 10
            CutImage(:,:,s) = RawImage;
            s=s+1;
        end
    end
    
end

FileName = ['I:/PIV_OUT/still/PIV_still_v_50.mat']; % output file name
save(FileName,'CutImage');  
%finish up
clear Image;