function [ grayscaleFolder ] = color2grayscale()

%color2grayscale Summary of this function goes here
%   Detailed explanation goes here

WorkingDir=cd;
ColoredImagesDir=[WorkingDir '\ColorImages'];
cd(ColoredImagesDir);
TotalColoredFiles=dir('*.jpg');
limit=length(TotalColoredFiles);

h = waitbar(0,'Please wait...');

%colorFolder = WorkingDir;
grayscaleFolder = fullfile(WorkingDir, 'GrayScaleImages');
if ~exist(grayscaleFolder, 'dir')
    mkdir(grayscaleFolder);
end

cd(grayscaleFolder);
delete('*.jpg');
disp('Previous GrayScale Folder Cleared...');
disp('Creating New Grayscale Images ...');

cd(WorkingDir);
for i = 1:limit
    Perc=(i/limit);
    waitbar(Perc,h,[sprintf('%1.0f',Perc*100) '% Complete Please Wait..., ']);
    name=[ColoredImagesDir '\' TotalColoredFiles(i).name];
    img=imread(name);
    grayImage = rgb2gray(img);
    i_count = num2str(i);
    tempName=strcat('jpeg_orig',i_count,'.jpg');
    fullFileName = fullfile(grayscaleFolder,tempName );
    imwrite(grayImage, fullFileName);
end

cd(WorkingDir);
close all force

end

