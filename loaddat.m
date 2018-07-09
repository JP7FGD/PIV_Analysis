function [ OutputVector ] = loaddat( file,Pos,DataSize )
%To load .dat file with given length
%  20180530 Sujoy
%Because this is used very frequent made it as functon.
FileID=fopen(sprintf(file),'r');
fseek(FileID,Pos,'bof');
OutputVector=fread(FileID,DataSize,'uint16');
fclose(FileID);
end

