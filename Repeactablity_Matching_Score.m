%
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

function [ homography ] = Repeactablity_Matching_Score()

curr_dir=cd;
detector = input('Enter name of detector ','s'); %esrb
database = input('Enter name of database ','s'); %bark
totalNo = input('Enter total number of images in folder '); %5
datasetNo = input('Enter number of images in a single dataset ');
fileExtension = input('Enter file extension ','s'); %.ppm

% saveFile = strcat('results\\original_repeatability\\',detector);
% saveFile = strcat(saveFile,'_');
% saveFile = strcat(saveFile,database);
% saveFile = strcat(saveFile,'_');
% saveFile = strcat(saveFile,'results');
% saveFile = strcat(saveFile,'.txt');
% fid = fopen(saveFile, 'w');



saveFile = strcat('results\\our_repeat_repeatability\\',detector);
saveFile = strcat(saveFile,'_');
saveFile = strcat(saveFile,database);
saveFile = strcat(saveFile,'_');
saveFile = strcat(saveFile,'results');
saveFile = strcat(saveFile,'.txt');

fid2 = fopen(saveFile, 'a');


% saveFile = strcat('results\\adrian_repeatability\\',detector);
% saveFile = strcat(saveFile,'_');
% saveFile = strcat(saveFile,database);
% saveFile = strcat(saveFile,'_');
% saveFile = strcat(saveFile,'results');
% saveFile = strcat(saveFile,'.txt');
% 
% fid3 = fopen(saveFile, 'w');
if(strcmp(database,'Light'))
    Img1=fullfile(curr_dir,'LightImages/PpmFiles/light');
    Img2=fullfile(curr_dir,'LightImages/PpmFiles/light');
    Desc1=fullfile(curr_dir,'dataset/');
    Desc2=fullfile(curr_dir,'dataset/');
    folder='Light/light';
else
    Img1=fullfile(curr_dir,'BlurImages/PpmFiles/blur');
    Img2=fullfile(curr_dir,'BlurImages/PpmFiles/blur');
    Desc1=fullfile(curr_dir,'dataset/');
    Desc2=fullfile(curr_dir,'dataset/');
    folder='Blur/blur';
end

    j=1;

while (j<=totalNo-datasetNo+1)
   count=1; 
    for i = j+1:j+datasetNo-1
       count=count+1;
        if(i==671 || i==672 || i==673 || i==674 || i==675 || i==676 || i==677)
            continue;
        end
%        if(i==1382 || i==1383 || i==1384 || i==1385 || i==1386 )
%           continue; 
%         end
%        if(count==2 &&j==527 )
%           i=537; 
%        end
%        disp(count);
        if(count>11)
           continue; 
        end
% %         
%         if (i==9)
%             disp('Ahmad');
% %             continue;
%         end
        img1 = strcat(Img1,num2str(j));
        img1 = strcat(img1,'.');
        img1 = strcat(img1,fileExtension);
    
    
        img2 = strcat(Img2,num2str(i));
        img2 = strcat(img2,'.');
        img2 = strcat(img2,fileExtension);
    
    %homographyNo = strcat('_H1to',num2str(i));
    %homographyNo = strcat(homographyNo,'p');
    %homography = strcat(dataset,homographyNo);
    
        homography = strcat('homography.txt');
   
    %homographyNo = strcat(homographyNo,'p');
    
    %homography = strcat(dataset,homographyNo);
        desc1 = fullfile(Desc1,detector);
        desc1 = fullfile(desc1,folder);
        %desc1 = strcat(desc1,database);
        desc1 = strcat(desc1,num2str(j));
        desc1 = strcat(desc1,'.txt');
    
        
         desc2 = fullfile(Desc2,detector);
        desc2 = fullfile(desc2,folder); 
%        desc2 = strcat(detector,folder);
        %desc2 = strcat(desc2,database);
    
        desc2 =strcat(desc2,num2str(i));
   % desc2 = strcat(desc2,'_siftdesc');
        desc2 = strcat(desc2,'.txt');
    
        fileExist=exist(desc2);
        if(fileExist<1)
            continue;
        end
    
    
%         [v_overlap, v_repeatability, v_nb_of_corespondences,matching_score,nb_of_matches] = repeatability(desc1, desc2,homography, img1,img2,1);
%     
%         imgNo = strcat(database,num2str(i));
%     
%         fprintf(fid,'\r\n');
%         fprintf(fid,'\n%s',imgNo);
%         fprintf(fid, ' ');
%         fprintf(fid,'%f',  v_overlap(4));
%         fprintf(fid, ' ');
%         fprintf(fid,'%f',  v_repeatability(4));
%         fprintf(fid, ' ');
%         fprintf(fid,'%f', v_nb_of_corespondences(4));
%         fprintf(fid, ' ');
%         fprintf(fid, '%f', nb_of_matches);
    

        [v_overlap, v_repeatability, v_nb_of_corespondences,matching_score,nb_of_matches,unused,number_features_img1,number_features_img2] = our_repeat(desc1, desc2,homography, img1,img2,1);
    
        imgNo = strcat(database,num2str(i));
    
        fprintf(fid2,'\r\n');
   
        fprintf(fid2,'\n%s',imgNo);
        fprintf(fid2, ' ');
        fprintf(fid2,'%f',  v_overlap(4));
        fprintf(fid2, ' ');
        fprintf(fid2,'%f',  v_repeatability(4));
        fprintf(fid2, ' ');
        fprintf(fid2,'%f', v_nb_of_corespondences(4));
        fprintf(fid2, ' ');
        fprintf(fid2, '%f', nb_of_matches);    
        fprintf(fid2, ' ');
        fprintf(fid2, '%d', number_features_img1);
        fprintf(fid2, ' ');
        fprintf(fid2, '%d', number_features_img2);
%     
%         [v_overlap, v_repeatability, v_nb_of_corespondences,matching_score,nb_of_matches] = adrian_repeat(desc1, desc2,homography, img1,img2,1);
%     
%         imgNo = strcat(database,num2str(i));
%        
%         fprintf(fid3,'\r\n');
%         fprintf(fid3,'\n%s',imgNo);
%         fprintf(fid3, ' ');
%         fprintf(fid3,'%f',  v_overlap(4));
%         fprintf(fid3, ' ');
%         fprintf(fid3,'%f',  v_repeatability(4));
%         fprintf(fid3, ' ');
%         fprintf(fid3,'%f', v_nb_of_corespondences(4));
%         fprintf(fid3, ' ');
%         fprintf(fid3, '%f', nb_of_matches);
    img1='';
    img2='';
    desc1='';
    desc2='';
    end
  j=j+datasetNo;
end
% fclose(fid);
fclose(fid2);
% fclose(fid3);
end