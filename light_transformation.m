%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MATLAB Code for generating image files with light changes   %
%Decrease in Brightness: 10% 20% 30% 40% 50% 55% 60% 65% 70% 75% 80% 85% 90% %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function [] = light_changes()

    WorkingDir=cd;
    GrayScaleImgFolder = fullfile(WorkingDir, 'GrayScaleImages');
    LightImgFolder = fullfile(WorkingDir, 'LightImages\PngFiles');
    if ~exist(LightImgFolder, 'dir')
        mkdir(LightImgFolder);
    end

    cd(LightImgFolder);
    delete('*.png');
    delete('*.jpg');

    cd(GrayScaleImgFolder);
    TotalGrayscaleImages=dir('*.jpg');
    j = 0;

    h = waitbar(0,'Please wait...');
    limit=length(TotalGrayscaleImages);

    for i = 1:limit
        Perc=(i/limit);
        waitbar(Perc,h,[sprintf('%1.0f',Perc*100) '% Complete Please Wait..., ']);

        i_count = num2str(i);
        img = imread(strcat('jpeg_orig',i_count,'.jpg'));

        new_image_copy = img;
        new_image_10 = imadjust(img,[0 1],[0 0.9]);
        new_image_20 = imadjust(img,[0 1],[0 0.8]);
        new_image_30 = imadjust(img,[0 1],[0 0.7]);
        new_image_40 = imadjust(img,[0 1],[0 0.6]);
        new_image_50 = imadjust(img,[0 1],[0 0.5]);
        new_image_55 = imadjust(img,[0 1],[0 0.45]);
        new_image_60 = imadjust(img,[0 1],[0 0.4]);
        new_image_65 = imadjust(img,[0 1],[0 0.35]);
        new_image_70 = imadjust(img,[0 1],[0 0.3]);
        new_image_75 = imadjust(img,[0 1],[0 0.25]);
        new_image_80 = imadjust(img,[0 1],[0 0.2]);
        new_image_85 = imadjust(img,[0 1],[0 0.15]);
        new_image_90 = imadjust(img,[0 1],[0 0.1]);

        cd(LightImgFolder);
        imwrite(new_image_copy,strcat('light',num2str(j+1),'.png'),'png');
        imwrite(new_image_10,strcat('light',num2str(j+2),'.png'),'png');
        imwrite(new_image_20,strcat('light',num2str(j+3),'.png'),'png');
        imwrite(new_image_30,strcat('light',num2str(j+4),'.png'),'png');
        imwrite(new_image_40,strcat('light',num2str(j+5),'.png'),'png');
        imwrite(new_image_50,strcat('light',num2str(j+6),'.png'),'png');
        imwrite(new_image_55,strcat('light',num2str(j+7),'.png'),'png');
        imwrite(new_image_60,strcat('light',num2str(j+8),'.png'),'png');
        imwrite(new_image_65,strcat('light',num2str(j+9),'.png'),'png');
        imwrite(new_image_70,strcat('light',num2str(j+10),'.png'),'png');
        imwrite(new_image_75,strcat('light',num2str(j+11),'.png'),'png');
        imwrite(new_image_80,strcat('light',num2str(j+12),'.png'),'png');
        imwrite(new_image_85,strcat('light',num2str(j+13),'.png'),'png');  
        imwrite(new_image_90,strcat('light',num2str(j+14),'.png'),'png');        
        j = j+14;
        cd(GrayScaleImgFolder);
    end
     cd(WorkingDir);
     close all force

end

