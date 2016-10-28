function [ output_args ] = Read_ResultFile(  )
%UNTITLED2 Summary of this function goes here
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

MaX(1)=100;
MiN(1)=100;
Mean(1)=100;

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
    MaX(img)=max(RepeatabiltyData);
    if(any(RepeatabiltyData(:)>0))
        MiN(img)=min(RepeatabiltyData(RepeatabiltyData>0));
        Mean(img)=median(RepeatabiltyData(RepeatabiltyData>0));
    else
        MiN(img)=min(RepeatabiltyData);
        Mean(img)=median(RepeatabiltyData);
    end
    
    I=1;
    clear RepeatabiltyData;
    
end
if(strcmp(database,'Blur'))
    x1=0:0.5:4.5;
else
    x1=[0 10 20 30 40 50 55 60 65 70 75 80 85 90];
end
x=1:1:finalImage;
y1=MaX(x);
y2=Mean(x);
y3=MiN(x);
figure
plot(x1,y1,x1,y2,x1,y3);
X=[x1,fliplr(x1)]; 
Y=[y1,fliplr(y2)];  
fill(X,Y,'g');
clear X;
clear Y;
hold on;
X=[x1,fliplr(x1)]; 
Y=[y2,fliplr(y3)];  
fill(X,Y,'g');
clear X;
clear Y;
hold on;
h=area(x1,y3);
set(h,'FaceColor','r');  

grid on;
if(strcmp(database,'Blur'))
	xlabel('INCREASING BLUR ');
else
	xlabel('DECREASING LIGHT ');
end

ylabel('REPEATABILITY PERCENTAGE');
hold on;
plot(x1,y1,'b*');
hold on;
plot(x1,y2,'g*');
hold on;
plot(x1,y3,'r*');
disp('All complete');
output=[MaX' MiN' Mean']

end

