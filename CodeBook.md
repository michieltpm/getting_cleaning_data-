==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Original data from: Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================
Analysed and adapted by M.van Veen for Coursera Getting and Cleaning Data
Script name: run_analysis.R

SUMMARY
30 volunteers performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing
two sensor signals (accelerometer and gyroscope). Script takes pre-analysed data from UCI HAR Dataset folder and generates a total dataframe with new variables. After that the script
makes an selection of the mean and standard deviation of the variables and calculates the mean of per variables per activity, per volunteer.


DETAIL
The data come from the accelerometer and gyroscope 3-axial raw signals acceleration (xyz) and gyroscope (xyz). Data was captured at a constant rate of 50 Hz and filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. The acceleration signal was separated into body and gravity acceleration signals (bodyacceleration and gravityacceleration (xyz)) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (bodyaccelerationjerk (xyz) and bodygyroscopejerk (xyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (bodyaccelerationmagnitude, gravityaccelerationmagnitude, bodyaccelerationjerkmagnitude, bodygyroscopemagnitude, bodygyroscopejerkmagnitude). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing transformedbodyacceleration (xyz), transformedbodyaccelerationjerk (xyz), transformedbodygyroscope (xyz), transformedbodyaccelerationjerkmagnitude, transformedbodygyroscopemagnitude, transformedbodygyroscopejerkmagnitude. (Note the 'transformed' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  
'xyz' is used to denote 3-axial signals in the x, y and z directions.
the time variables for all but the transformed measurements was taken out of the variable name since this is a common denominator.

data contains:
- The total mean and standard deviation per acivity per person derived from the mean estimated body acceleration, gravity and gyroscope. The mean body accelerations were derived from the triaxial acceleration from the accelerometer (total acceleration).
- mean triaxial Angular velocity from the gyroscope. 
- 86 variable means (46variables) or standarddeviation (33 variables) with time and frequency (transformed) domain variables. 7 anglebodymean and anglegravitymean variables are included in the dataset.
- 1 activity variabel containing: walk,walkdown, walkup, sit, lay, stand. (6 activties)
- 1 subject variabel who carried out the experiment. (30 subjects)
- dim df: 88 variables and 180 measurements

mean: 					mean value
standarddeviation: 			Standard deviation
angle: 					Angle between vectors.
magnitude				magnitude of the three-dimensional signals (xyz) calculated using the Euclidean norm
jerk: 					body linear acceleration and angular velocity derived in time
jerkmagagnitude: 			magnitude of jerk(xyz) three-dimensional signals calculated using the Euclidean norm
gravity: 				acceleration signals separated into body and gravity acceleration signals, in this case gravity
body: 					acceleration signals separated into body and gravity acceleration signals, in this case body
gyroscope: 				gyroscope measurements
xyz: 					3-axial signals from accelerometer and gyroscope
bodybody:				variable present in the original dataset, probably a notation mistake: bodybody needs to be body. 
meanfrequency:				the mean frequency domain signals from the Fast Fourier Transformation (FFT)


ALL VARIABLES
[1] "bodyaccelerationmeanx"                                        
 [2] "bodyaccelerationmeany"                                        
 [3] "bodyaccelerationmeanz"                                        
 [4] "gravityaccelerationmeanx"                                     
 [5] "gravityaccelerationmeany"                                     
 [6] "gravityaccelerationmeanz"                                     
 [7] "bodyaccelerationjerkmeanx"                                    
 [8] "bodyaccelerationjerkmeany"                                    
 [9] "bodyaccelerationjerkmeanz"                                    
[10] "bodygyroscopemeanx"                                           
[11] "bodygyroscopemeany"                                           
[12] "bodygyroscopemeanz"                                           
[13] "bodygyroscopejerkmeanx"                                       
[14] "bodygyroscopejerkmeany"                                       
[15] "bodygyroscopejerkmeanz"                                       
[16] "bodyaccelerationmagnitudemean"                                
[17] "gravityaccelerationmagnitudemean"                             
[18] "bodyaccelerationjerkmagnitudemean"                            
[19] "bodygyroscopemagnitudemean"                                   
[20] "bodygyroscopejerkmagnitudemean"                               
[21] "transformedbodyaccelerationmeanx"                             
[22] "transformedbodyaccelerationmeany"                             
[23] "transformedbodyaccelerationmeanz"                             
[24] "transformedbodyaccelerationmeanfrequencyx"                    
[25] "transformedbodyaccelerationmeanfrequencyy"                    
[26] "transformedbodyaccelerationmeanfrequencyz"                    
[27] "transformedbodyaccelerationjerkmeanx"                         
[28] "transformedbodyaccelerationjerkmeany"                         
[29] "transformedbodyaccelerationjerkmeanz"                         
[30] "transformedbodyaccelerationjerkmeanfrequencyx"                
[31] "transformedbodyaccelerationjerkmeanfrequencyy"                
[32] "transformedbodyaccelerationjerkmeanfrequencyz"                
[33] "transformedbodygyroscopemeanx"                                
[34] "transformedbodygyroscopemeany"                                
[35] "transformedbodygyroscopemeanz"                                
[36] "transformedbodygyroscopemeanfrequencyx"                       
[37] "transformedbodygyroscopemeanfrequencyy"                       
[38] "transformedbodygyroscopemeanfrequencyz"                       
[39] "transformedbodyaccelerationmagnitudemean"                     
[40] "transformedbodyaccelerationmagnitudemeanfrequency"            
[41] "transformedbodybodyaccelerationjerkmagnitudemean"             
[42] "transformedbodybodyaccelerationjerkmagnitudemeanfrequency"    
[43] "transformedbodybodygyroscopemagnitudemean"                    
[44] "transformedbodybodygyroscopemagnitudemeanfrequency"           
[45] "transformedbodybodygyroscopejerkmagnitudemean"                
[46] "transformedbodybodygyroscopejerkmagnitudemeanfrequency"       
[47] "bodyaccelerationstandarddeviationx"                           
[48] "bodyaccelerationstandarddeviationy"                           
[49] "bodyaccelerationstandarddeviationz"                           
[50] "gravityaccelerationstandarddeviationx"                        
[51] "gravityaccelerationstandarddeviationy"                        
[52] "gravityaccelerationstandarddeviationz"                        
[53] "bodyaccelerationjerkstandarddeviationx"                       
[54] "bodyaccelerationjerkstandarddeviationy"                       
[55] "bodyaccelerationjerkstandarddeviationz"                       
[56] "bodygyroscopestandarddeviationx"                              
[57] "bodygyroscopestandarddeviationy"                              
[58] "bodygyroscopestandarddeviationz"                              
[59] "bodygyroscopejerkstandarddeviationx"                          
[60] "bodygyroscopejerkstandarddeviationy"                          
[61] "bodygyroscopejerkstandarddeviationz"                          
[62] "bodyaccelerationmagnitudestandarddeviation"                   
[63] "gravityaccelerationmagnitudestandarddeviation"                
[64] "bodyaccelerationjerkmagnitudestandarddeviation"               
[65] "bodygyroscopemagnitudestandarddeviation"                      
[66] "bodygyroscopejerkmagnitudestandarddeviation"                  
[67] "transformedbodyaccelerationstandarddeviationx"                
[68] "transformedbodyaccelerationstandarddeviationy"                
[69] "transformedbodyaccelerationstandarddeviationz"                
[70] "transformedbodyaccelerationjerkstandarddeviationx"            
[71] "transformedbodyaccelerationjerkstandarddeviationy"            
[72] "transformedbodyaccelerationjerkstandarddeviationz"            
[73] "transformedbodygyroscopestandarddeviationx"                   
[74] "transformedbodygyroscopestandarddeviationy"                   
[75] "transformedbodygyroscopestandarddeviationz"                   
[76] "transformedbodyaccelerationmagnitudestandarddeviation"        
[77] "transformedbodybodyaccelerationjerkmagnitudestandarddeviation"
[78] "transformedbodybodygyroscopemagnitudestandarddeviation"       
[79] "transformedbodybodygyroscopejerkmagnitudestandarddeviation"   
[80] "anglebodyaccelerationmeangravity"                             
[81] "anglebodyaccelerationjerkmeangravitymean"                     
[82] "anglebodygyroscopemeangravitymean"                            
[83] "anglebodygyroscopejerkmeangravitymean"                        
[84] "anglexgravitymean"                                            
[85] "angleygravitymean"                                            
[86] "anglezgravitymean"                                            
[87] "activities"                                                   
[88] "subject"

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
