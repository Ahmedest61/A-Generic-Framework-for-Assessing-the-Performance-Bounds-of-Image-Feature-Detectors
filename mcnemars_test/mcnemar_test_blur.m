%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The Z-Scores are written in the z_score matrix (9 Rows and 9 columns)according to the following
% template:
% McNemar's Test Repeatability Thresholds       Blur Changes
%                                              0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5      
% ------------------------------------------------------------------------------------- 
%  10                         |    
%  20                         |
%  30                         |
%  40                         |
%  50                         |
%  60                         |
%  70                         |
%  80                         |
%  90                         |
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
clc;

a = load('ibr_blur_results.txt');
b = load('mser_blur_results.txt');

combined_ibr = [a];
combined_mser = [b];

%ref_val = (x_dim*y_dim)/(2*(x_dim + y_dim))
for k = 1:9,

end_count = k*100;
start_count = end_count - 100 + 1;

for ref_val = 10:10:90,
    
%ref_val = 10;

pass_pass = 0;
pass_fail = 0;
fail_pass = 0;
fail_fail = 0;
%z_score = 0;


for i = start_count:end_count,
    ibr_val = combined_ibr(i,1);
    mser_val = combined_mser(i,1);
    
    if ((ibr_val >= ref_val)&&(mser_val >= ref_val)),
        pass_pass = pass_pass + 1;
    end
    if ((ibr_val >= ref_val)&&(mser_val < ref_val)),
        pass_fail = pass_fail + 1;
    end
    if ((ibr_val < ref_val)&&(mser_val >= ref_val)),
        fail_pass = fail_pass + 1;
    end
    if ((ibr_val < ref_val)&&(mser_val < ref_val)),
        fail_fail = fail_fail + 1;
    end
end

z_score(ref_val/10,k) = (abs(pass_fail - fail_pass)-1)/sqrt(pass_fail + fail_pass);

if ((pass_fail + fail_pass)> 30),
    
    if pass_fail == fail_pass,
        z_score(ref_val/10,k) = 0;
    end
    
    if fail_pass > pass_fail,
        z_score(ref_val/10,k) = -z_score(ref_val/10,k);
    end

else
    z_score(ref_val/10,k) = 0;
end

% fprintf(1,'\nRepeatability Threshold for McNemar Test %d\n',ref_val);
% fprintf(1,'\nPass-Pass: %d\n',pass_pass);
% fprintf(1,'Pass-Fail: %d\n',pass_fail);
% fprintf(1,'Fail-Pass: %d\n',fail_pass);
% fprintf(1,'Fail-Fail: %d\n',fail_fail);
% fprintf(1,'Z-Score: %f\n',z_score(ref_val/10));
% fprintf(1,'\n');

end

end

% fprintf(1,'\n %f',z_score(1));
% fprintf(1,'\n %f',z_score(2));
% fprintf(1,'\n %f',z_score(3));
% fprintf(1,'\n %f',z_score(4));
% fprintf(1,'\n %f',z_score(5));
% fprintf(1,'\n %f',z_score(6));
% fprintf(1,'\n %f',z_score(7));
% fprintf(1,'\n %f',z_score(8));
% fprintf(1,'\n %f',z_score(9));
% fprintf(1,'\n');
z_score = z_score

less_than_minus_85 = find(z_score < -85)
greater_than_85 = find(z_score > 85)
a = z_score;
imagesc(a);figure(gcf);
saveas(gcf,'hessian1.tiff','tiff');
set(gca,'XTick',[1 2 3 4 5 6 7 8 9]);
set(gca,'YTick',[1 2 3 4 5 6 7 8 9]);
set(gca,'XTicklabel',[0.5 1.0 1.5 2.0 2.5 3.0 3.5 4.0 4.5],'fontsize',16);
set(gca,'YTicklabel',[10 20 30 40 50 60 70 80 90],'fontsize',16);
xlabel('Increasing Blur','fontsize',18);
ylabel('Test Threshold','fontsize',18);
title('IBR and MSER','fontsize',20);
colormap(jet);
caxis([-25, 25]);
colorbar('fontsize',16);
colorbar('location','southoutside');
saveas(gcf,'ibr-mser.tiff','tiff');
I = imread('ibr-mser.tiff');
img = imcrop(I,[70 0 1031 901]);
imwrite(img,'ibr-mser.tiff');
shg
