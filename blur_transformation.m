%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MATLAB Code for generating image files with blur changes   %
%Blur Amount: 10% 20% 30% 40% 50% 60% 70% 80% 90% %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [] = blur_transformation()
    
    WorkingDir=cd;
    GrayScaleImgFolder = fullfile(WorkingDir, 'GrayScaleImages');
    BlurImgFolder = fullfile(WorkingDir, 'BlurImages/PngFiles');
    if ~exist(BlurImgFolder, 'dir')
        mkdir(BlurImgFolder);
    end

    cd(BlurImgFolder);
    delete('*.png');
    delete('*.jpg');

    

    cd(GrayScaleImgFolder);
    TotalGrayscaleImages=dir('*.jpg');
    j = 0;
    limit=length(TotalGrayscaleImages);
    
    hWait = waitbar(0,'Please wait...');

    for i = 1:limit
        Perc=(i/limit);
        waitbar(Perc,hWait,[sprintf('%1.0f',Perc*100) '% Complete Please Wait..., ']);

        i_count = num2str(i);
        img = imread(strcat('jpeg_orig',i_count,'.jpg'));
        %img = rgb2gray(img);
        new_image_copy = img;
        
        h = fspecial('gaussian',size(img),0.5);
        new_image_1 = imfilter(img,h);
        clear h;
        
        h = fspecial('gaussian',size(img),1.0);
        new_image_2 = imfilter(img,h);
        clear h;
        
        h = fspecial('gaussian',size(img),1.5);
        new_image_3 = imfilter(img,h);
        clear h;
        
        h = fspecial('gaussian',size(img),2.0);
        new_image_4 = imfilter(img,h);
        clear h;
        
        h = fspecial('gaussian',size(img),2.5);
        new_image_5 = imfilter(img,h);
        clear h;
        
        h = fspecial('gaussian',size(img),3.0);
        new_image_6 = imfilter(img,h);
        clear h;
        
        h = fspecial('gaussian',size(img),3.5);
        new_image_7 = imfilter(img,h);
        clear h;
        
        h = fspecial('gaussian',size(img),4.0);
        new_image_8 = imfilter(img,h);
        clear h;
        
        h = fspecial('gaussian',size(img),4.5);
        new_image_9 = imfilter(img,h);
        clear h;
        
        cd(BlurImgFolder);
               
        imwrite(new_image_copy,strcat('blur',num2str(j+1),'.png'),'png');
        imwrite(new_image_1,strcat('blur',num2str(j+2),'.png'),'png');
        imwrite(new_image_2,strcat('blur',num2str(j+3),'.png'),'png');
        imwrite(new_image_3,strcat('blur',num2str(j+4),'.png'),'png');
        imwrite(new_image_4,strcat('blur',num2str(j+5),'.png'),'png');
        imwrite(new_image_5,strcat('blur',num2str(j+6),'.png'),'png');
        imwrite(new_image_6,strcat('blur',num2str(j+7),'.png'),'png');
        imwrite(new_image_7,strcat('blur',num2str(j+8),'.png'),'png');
        imwrite(new_image_8,strcat('blur',num2str(j+9),'.png'),'png');
        imwrite(new_image_9,strcat('blur',num2str(j+10),'.png'),'png');
        j = j+10;
        cd(GrayScaleImgFolder);
    end
     cd(WorkingDir);
     close all force
end

