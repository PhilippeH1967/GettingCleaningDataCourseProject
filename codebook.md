CodeBook For Getting and Cleaning Data Course Project
=====================================================                  
                                                                                
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

Transformations
===============

- We have selected the original variables which contain either mean or std in their names.
- Then the output variables have been set with the average of each variable group by subject and activity
- more details in README.md

Resulting Dataset
=================

### Variables:
- **subject** : 1 to 30                         
- **activity** : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING            
- **timeBodyAccMeanX** : average mesurements of selected features by subject and activity. see below the explanations
- **timeBodyAccMeanY**
- **timeBodyAccMeanZ**        
- **timeBodyAccStdX**
- **timeBodyAccStdY**
- **timeBodyAccStdZ**
- **timeGravityAccMeanX**
- **timeGravityAccMeanY**
- **timeGravityAccMeanZ**          
- **timeGravityAccStdX**
- **timeGravityAccStdY**
- **timeGravityAccStdZ**             
- **timeBodyAccJerkMeanX**
- **timeBodyAccJerkMeanY**
- **timeBodyAccJerkMeanZ**
- **timeBodyAccJerkStdX**
- **timeBodyAccJerkStdY**
- **timeBodyAccJerkStdZ**            
- **timeBodyGyroMeanX**
- **timeBodyGyroMeanY**
- **timeBodyGyroMeanZ**              
- **timeBodyGyroStdX**
- **timeBodyGyroStdY**
- **timeBodyGyroStdZ**
- **timeBodyGyroJerkMeanX**
- **timeBodyGyroJerkMeanY**
- **timeBodyGyroJerkMeanZ**
- **timeBodyGyroJerkStdX**
- **timeBodyGyroJerkStdY**
- **timeBodyGyroJerkStdZ**         
- **timeBodyAccMagMean**
- **timeBodyAccMagStd**
- **timeGravityAccMagMean**
- **timeGravityAccMagStd**
- **timeBodyAccJerkMagMean**
- **timeBodyAccJerkMagStd**          
- **timeBodyGyroMagMean**
- **timeBodyGyroMagStd**
- **timeBodyGyroJerkMagMean**
- **timeBodyGyroJerkMagStd**
- **freqBodyAccMeanX**
- **freqBodyAccMeanY**
- **freqBodyAccMeanZ**
- **freqBodyAccStdX**
- **freqBodyAccStdY**
- **freqBodyAccStdZ**
- **freqBodyAccMeanFreqX**
- **freqBodyAccMeanFreqY**
- **freqBodyAccMeanFreqZ**
- **freqBodyAccJerkMeanX**
- **freqBodyAccJerkMeanY**           
- **freqBodyAccJerkMeanZ**
- **freqBodyAccJerkStdX**
- **freqBodyAccJerkStdY**
- **freqBodyAccJerkStdZ**
- **freqBodyAccJerkMeanFreqX**
- **freqBodyAccJerkMeanFreqY**       
- **freqBodyAccJerkMeanFreqZ**
- **freqBodyGyroMeanX**
- **freqBodyGyroMeanY**              
- **freqBodyGyroMeanZ**
- **freqBodyGyroStdX**
- **freqBodyGyroStdY**               
- **freqBodyGyroStdZ**
- **freqBodyGyroMeanFreqX**
- **freqBodyGyroMeanFreqY**          
- **freqBodyGyroMeanFreqZ**
- **freqBodyAccMagMean**
- **freqBodyAccMagStd**              
- **freqBodyAccMagMeanFreq**
- **freqBodyBodyAccJerkMagMean**
- **freqBodyBodyAccJerkMagStd**      
- **freqBodyBodyAccJerkMagMeanFreq**
- **freqBodyBodyGyroMagMean**
- **freqBodyBodyGyroMagStd**     
- **freqBodyBodyGyroMagMeanFreq**
- **freqBodyBodyGyroJerkMagMean**
- **freqBodyBodyGyroJerkMagStd**
- **freqBodyBodyGyroJerkMagMeanFreq**

Original Features
=================

The foriginal features for this database come from the accelerometer and gyroscope 3-axial raw signals timeAcc-XYZ and timeGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (timeBodyAcc-XYZ and timeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (timeBodyAccJerk-XYZ and timeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (timeBodyAccMag, timeGravityAccMag, timeBodyAccJerkMag, timeBodyGyroMag, timeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing freqBodyAcc-XYZ, freqBodyAccJerk-XYZ, freqBodyGyro-XYZ, freqBodyAccJerkMag, freqBodyGyroMag, freqBodyGyroJerkMag. (Note the 'freq' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

