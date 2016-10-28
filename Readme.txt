Summary: Open source code for framework presented in the following paper: https://arxiv.org/abs/1605.05791

Description: This open source code is the implementation of the framework presented in the following paper:
A Generic Framework for Assessing the Performance Bounds of Image Feature Detectors
Shoaib Ehsan, Adrian F. Clark, Ales Leonardis, Naveed ur Rehman, Ahmad Khaliq, Maria Fasli and Klaus D. McDonald-Maier

This paper is currently under review in Remote Sensing Journal and is also freely available to download from the following link:

https://arxiv.org/abs/1605.05791

This package contains the matlab files for carrying out the following functionalities required for computing repeatability and matching score between two images:

1) Color to Grayscale conversion
	This function requires no user input as you need to hardcode the path of the colored images folder to read out the image files (jpg,png etc), convert them into grayscale and store them in a folder under the current working folder/directory.

2) 	Blur Transformation 
	This function also requires a user to hardcode the path of grayscale images folder from where it will read the image files (jpg,png etc), it applies blur transformation to a single image and generates 9 Blur images with 10%,20%,30%,40%,50%,60%,70%,80%,90% blurring and save these images in a Blur image folder (jpg,pgm,ppm etc).
	
3)  Light Transformation
	This function works similar to the Blur tranformation function, the only difference is it generates 13 light transformed images with 10%,20%,30%,40%,50%,55%,60%,65%,70%,75%,80%,85%,90% decrease brightness and saves them in a Light image folder (ppm,png etc).	
	
4)	Repeatiabilty and Matching  score calculation
	This function takes the name of detector (Ibr etc), the database type (Blur), the number of overall images (1000 for blur in our case), number of dataset images(10 for blur in our case) and a image file type which is "ppm". The user needs to hardcode the ppm image file paths and text file paths of specified detector's output then the funtion writes down the result into the file.  
	Recompliling c_eoverlap.cxx  and descdist.cxx might be necessary here.	
		matlab>>mex c_eoverlap.cxx;
		matlab>>mex descdist.cxx;	
		
5)	Read Result files
	This function requires a user to input the detector's name (Ibr,Mser etc) and the type of Images/Database (Blur,Light), it then reads the result file of the user's entered detector and database i.e. Ibr_Blur_results. Using the file, it calculates the maximuum, mean and minimum values of the images with same blur/light tranformation and plot it in a form of graph which contains a minimum, median and a maximum curve of specific database of the detector.	

6)	Read Result files for McNmer
	This function similar to read result file function, as it takes the same input parameters and gernerate a result file fot McNemar.
	
7)   McNemar's Test files
     The folder mcnemars_test contains the MATLAB code for computing McNemar's test results. The sample input files for the code are also given in this folder.   	


	