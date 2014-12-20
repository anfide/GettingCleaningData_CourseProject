# Codebook

See the README.md file for additional background information about the source of the original data set that was processed for this course project.

The data set described here is the tidy data set with the average of each variable for each activity and each subject.

## Original data set features 

Quoted verbatim from the original project documentation (features_info.txt):

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 
> 
> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
> 
> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
> 
> These signals were used to estimate variables of the feature vector for each pattern:  
> '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
> 
> * tBodyAcc-XYZ
> * tGravityAcc-XYZ
> * tBodyAccJerk-XYZ
> * tBodyGyro-XYZ
> * tBodyGyroJerk-XYZ
> * tBodyAccMag
> * tGravityAccMag
> * tBodyAccJerkMag
> * tBodyGyroMag
> * tBodyGyroJerkMag
> * fBodyAcc-XYZ
> * fBodyAccJerk-XYZ
> * fBodyGyro-XYZ
> * fBodyAccMag
> * fBodyAccJerkMag
> * fBodyGyroMag
> * fBodyGyroJerkMag
> 
> The set of variables that were estimated from these signals are: 
> 
> * mean(): Mean value
> * std(): Standard deviation
> * mad(): Median absolute deviation 
> * max(): Largest value in array
> * min(): Smallest value in array
> * sma(): Signal magnitude area
> * energy(): Energy measure. Sum of the squares divided by the number of values. 
> * iqr(): Interquartile range 
> * entropy(): Signal entropy
> * arCoeff(): Autorregresion coefficients with Burg order equal to 4
> * correlation(): correlation coefficient between two signals
> * maxInds(): index of the frequency component with largest magnitude
> * meanFreq(): Weighted average of the frequency components to obtain a mean frequency
> * skewness(): skewness of the frequency domain signal 
> * kurtosis(): kurtosis of the frequency domain signal 
> * bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
> * angle(): Angle between to vectors.
> 
> Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:
> 
> * gravityMean
> * tBodyAccMean
> * tBodyAccJerkMean
> * tBodyGyroMean
> * tBodyGyroJerkMean
> 
> The complete list of variables of each feature vector is available in 'features.txt'

## Tidy data set

This data set can be found in the tidydata_with_means.txt file.

The data set consists of accelerometer and gyroscope data collected from 30 subjects that performed 6 different activities: WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS; SITTING; STANDING; LAYING. Each combination of subject and activity corresponds to a row of the data set so that it has 30*6 = 180 rows.

For each subject+activity, the data set provides the average value of 79 features from the original data set.
The averaged features are of the kinds:
* mean - Mean value
* stddev - Standard deviation
* meanFreq - Weighted average of the frequency components to obtain a mean frequency

### Feature list

The variables 3-81 are averages computed for the combination of subject + activity in the columns 1-2.

<table>
 <tr>
  <td>ID</td>
  <td>Name</td>
  <td>Description</td>
  <td>Range of Values</td>
 </tr>

<tr><td>1	</td><td>SubjectID                              </td><td> ID of the subject who performed the activity </td> <td> 1-30 </td> </tr>
<tr><td>2	</td><td>Activity                               </td><td> Activity that was performed and monitored </td> <td>One of the following: WALKING; WALKING_UPSTAIRS; WALKING_DOWNSTAIRS; SITTING; STANDING; LAYING </td> </tr>
<tr><td>3	</td><td>Time.BodyAcc.mean.X                    </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>4	</td><td>Time.BodyAcc.mean.Y                    </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>5	</td><td>Time.BodyAcc.mean.Z                    </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>6	</td><td>Time.BodyAcc.stddev.X                  </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>7	</td><td>Time.BodyAcc.stddev.Y                  </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>8	</td><td>Time.BodyAcc.stddev.Z                  </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>9	</td><td>Time.GravityAcc.mean.X                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>10	</td><td>Time.GravityAcc.mean.Y                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>11	</td><td>Time.GravityAcc.mean.Z                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>12	</td><td>Time.GravityAcc.stddev.X               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>13	</td><td>Time.GravityAcc.stddev.Y               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>14	</td><td>Time.GravityAcc.stddev.Z               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>15	</td><td>Time.BodyAccJerk.mean.X                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>16	</td><td>Time.BodyAccJerk.mean.Y                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>17	</td><td>Time.BodyAccJerk.mean.Z                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>18	</td><td>Time.BodyAccJerk.stddev.X              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>19	</td><td>Time.BodyAccJerk.stddev.Y              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>20	</td><td>Time.BodyAccJerk.stddev.Z              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>21	</td><td>Time.BodyGyro.mean.X                   </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>22	</td><td>Time.BodyGyro.mean.Y                   </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>23	</td><td>Time.BodyGyro.mean.Z                   </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>24	</td><td>Time.BodyGyro.stddev.X                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>25	</td><td>Time.BodyGyro.stddev.Y                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>26	</td><td>Time.BodyGyro.stddev.Z                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>27	</td><td>Time.BodyGyroJerk.mean.X               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>28	</td><td>Time.BodyGyroJerk.mean.Y               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>29	</td><td>Time.BodyGyroJerk.mean.Z               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>30	</td><td>Time.BodyGyroJerk.stddev.X             </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>31	</td><td>Time.BodyGyroJerk.stddev.Y             </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>32	</td><td>Time.BodyGyroJerk.stddev.Z             </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>33	</td><td>Time.BodyAccMag.mean                   </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>34	</td><td>Time.BodyAccMag.stddev                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>35	</td><td>Time.GravityAccMag.mean                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>36	</td><td>Time.GravityAccMag.stddev              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>37	</td><td>Time.BodyAccJerkMag.mean               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>38	</td><td>Time.BodyAccJerkMag.stddev             </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>39	</td><td>Time.BodyGyroMag.mean                  </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>40	</td><td>Time.BodyGyroMag.stddev                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>41	</td><td>Time.BodyGyroJerkMag.mean              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>42	</td><td>Time.BodyGyroJerkMag.stddev            </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>43	</td><td>Freq.BodyAcc.mean.X                    </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>44	</td><td>Freq.BodyAcc.mean.Y                    </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>45	</td><td>Freq.BodyAcc.mean.Z                    </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>46	</td><td>Freq.BodyAcc.stddev.X                  </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>47	</td><td>Freq.BodyAcc.stddev.Y                  </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>48	</td><td>Freq.BodyAcc.stddev.Z                  </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>49	</td><td>Freq.BodyAcc.meanFreq.X                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>50	</td><td>Freq.BodyAcc.meanFreq.Y                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>51	</td><td>Freq.BodyAcc.meanFreq.Z                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>52	</td><td>Freq.BodyAccJerk.mean.X                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>53	</td><td>Freq.BodyAccJerk.mean.Y                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>54	</td><td>Freq.BodyAccJerk.mean.Z                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>55	</td><td>Freq.BodyAccJerk.stddev.X              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>56	</td><td>Freq.BodyAccJerk.stddev.Y              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>57	</td><td>Freq.BodyAccJerk.stddev.Z              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>58	</td><td>Freq.BodyAccJerk.meanFreq.X            </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>59	</td><td>Freq.BodyAccJerk.meanFreq.Y            </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>60	</td><td>Freq.BodyAccJerk.meanFreq.Z            </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>61	</td><td>Freq.BodyGyro.mean.X                   </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>62	</td><td>Freq.BodyGyro.mean.Y                   </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>63	</td><td>Freq.BodyGyro.mean.Z                   </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>64	</td><td>Freq.BodyGyro.stddev.X                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>65	</td><td>Freq.BodyGyro.stddev.Y                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>66	</td><td>Freq.BodyGyro.stddev.Z                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>67	</td><td>Freq.BodyGyro.meanFreq.X               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>68	</td><td>Freq.BodyGyro.meanFreq.Y               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>69	</td><td>Freq.BodyGyro.meanFreq.Z               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>70	</td><td>Freq.BodyAccMag.mean                   </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>71	</td><td>Freq.BodyAccMag.stddev                 </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>72	</td><td>Freq.BodyAccMag.meanFreq               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>73	</td><td>Freq.BodyAccJerkMag.mean               </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>74	</td><td>Freq.BodyAccJerkMag.stddev             </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>75	</td><td>Freq.BodyAccJerkMag.meanFreq           </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>76	</td><td>Freq.BodyGyroMag.mean                  </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>77	</td><td>Freq.BodyGyroMag.stddev                </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>78	</td><td>Freq.BodyGyroMag.meanFreq              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>79	</td><td>Freq.BodyGyroJerkMag.mean              </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>80	</td><td>Freq.BodyGyroJerkMag.stddev            </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
<tr><td>81	</td><td>Freq.BodyGyroJerkMag.meanFreq          </td><td></td> <td>Normalized to the [-1, 1] interval </td> </tr>
</table>