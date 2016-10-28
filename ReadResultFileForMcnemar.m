function [ output_args ] = ReadResultFileForMcnemar( input_args )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


curr_dir=cd;
detector = input('Enter name of detector ','s'); 
database = input('Enter name of database ','s'); 
File = strcat('results/our_repeat_repeatability/',detector);
File = strcat(File,'_');
File = strcat(File,database);
File = strcat(File,'_');
File = strcat(File,'results');
File = strcat(File,'.txt');
saveFile=strcat('results/mcnmar/',detector);
saveFile=strcat(saveFile,'_');

saveFile = strcat(saveFile,database);
saveFile = strcat(saveFile,'_');
saveFile = strcat(saveFile,'results');
saveFile = strcat(saveFile,'.txt');

if(strcmp(database,'Blur'))
   finalImage=10;
   inc=finalImage;
else
   finalImage=14;
   inc=finalImage;
end
NoOfFiles=100;
fid = fopen(File,'r');
DefValue=database;
I=1;
data = textscan( fid, '%s %f %f %f %f %d %d','delimiter',' ','headerlines',1);
    fid2 = fopen(saveFile, 'w');

    %%%%%%%%%%%
    
for img=2:finalImage
    DefInd=img;
    for file=1:NoOfFiles
        Value=DefValue;    
        index=num2str(DefInd);
        Value=strcat(Value,index);
        idx = strcmp(Value,data{1});
        f = @(x) x(idx);
        Row = cellfun(f,data,'uniformoutput',false);
        if(Row{1,3}~=0)
            RepeatabiltyData(I)=Row{1,3};
            fprintf(fid2,'%f\n',RepeatabiltyData(I));
        else 
            RepeatabiltyData(I)=0;
            fprintf(fid2,'%f\n',RepeatabiltyData(I-1));
        end
        I=I+1;
        DefInd=DefInd+inc;
        
        clear idx;
        clear f;

    end
    clear RepeatabiltyData;
    
end 
    fclose(fid2);
end