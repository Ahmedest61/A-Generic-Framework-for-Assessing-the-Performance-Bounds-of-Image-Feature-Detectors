function [ output_args ] = Read_ResultFile(  )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
curr_dir=cd;
detector = input('Enter name of detector ','s'); %esrb
database = input('Enter name of database ','s'); %bark
%ImagNo= input('Enter the index of image must be >1 ');
File = strcat('results/our_repeat_repeatability/',detector);
File = strcat(File,'_');
File = strcat(File,database);
File = strcat(File,'_');
File = strcat(File,'results');
File = strcat(File,'.txt');

if(strcmp(database,'Blur'))
   finalImage=10;
   inc=finalImage;
else
   finalImage=14;
   inc=finalImage;
end
NoOfFiles=100;
%fid = fopen('G:\MS test preparations\Nomi bhai\Repeatability\Repeatability\results\TestFile.txt','r');
fid = fopen(File,'r');

%linenum = 3; % max
DefValue=database;
%DefInd=ImagNo;
I=1;
data = textscan( fid, '%s %f %f %f %f %d %d','delimiter',' ','headerlines',1);

% MaX(1)=1;
% MiN(1)=1;
% Mean(1)=1;

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
        else 
            RepeatabiltyData(I)=0;
        end
        I=I+1;
        DefInd=DefInd+inc;
        clear ETEdata;
        clear idx;
        clear f;

    end
%     if(img ==6)
%        disp('A'); 
%     end
    MaX(img)=max(RepeatabiltyData);
    if(any(RepeatabiltyData(:)>0))
        MiN(img)=min(RepeatabiltyData(RepeatabiltyData>0));
        Mean(img)=mean(RepeatabiltyData(RepeatabiltyData>0));
    else
        MiN(img)=min(RepeatabiltyData);
        Mean(img)=mean(RepeatabiltyData);
    end
    
    I=1;
    clear RepeatabiltyData;
    
end

x=2:1:finalImage;
y1=MaX(x);
y2=Mean(x);
y3=MiN(x);
figure
plot(x,y1,x,y2,x,y3);
% % plot(x(point),MaX(point),x(point),Mean(point),x(point),MiN(point),'*')
% 
% for point=1:finalImage
%    % plot(x(point),MaX(point),x(point),Mean(point),x(point),MiN(point),'*')
%     plot(x(point),MaX(point),'*')
% end
disp('All complete');
end
%     
%     if(strcmp(C{1,1}{1,1},Value)==1)
%        disp(C{1,1}{2,1}); 
%     end
    %C{1,1}{2,1}
    %fclose(fid);
    
 %   C=textscan(fid, '%f %f32 %f %f %f %f %f');
 %   C=textscan(fid, '%s', 1, 'delimiter', '\n', 'headerlines', linenum-1);
%    celldisp(C)
  %  strcpy();
%    C{3}
%    linenum=linenum+16;


