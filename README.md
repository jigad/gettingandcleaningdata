Getting and Cleaning Data Course Project
======================

This is the repository I have made for the Getting And Cleaning Data Coursera Course. This README.md explains how I got to the (hopefully) tidy data set included within the repo.

## Study Design
I took the data that was given to me. 
[Here's how they got the data I got](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) (taken from the project description)

### Instructions for my Tidy Data Set 
(Pretty much the comments from my run_analysis.R file)
1. Ingest all of the label data found in features.txt and activity_labels.txt

2. Read in the training data sets. (subject\_train.txt, X\_train.txt and Y\_train.txt)

3. Name the columns of X\_train according to the features label data.

4. Name the unnamed columns. For this, I named the Y\_train data "activity" and the subject\_train data "subject"

5. Using cbind, add in the columns for activity and subject to the end of the X\_train data.

6. Do steps 2-6, but for the testing data sets

7. rbind the newly built training and testing data sets to create a full set

8. To keep only the mean and std columns (and the newly created columns, "activity" and "subject"), use a regular expresion, searching for and including on the columns that have ".mean()", ".std()", "activity" and "subject".

9. Use the activities label loaded in step 1 to replace the numeric activities with their descriptive names labels.

10. Using a melt function, group the data set by subject and activity

11. Perform a aggregate mean function against the newly melted data frame

12. Write the table out to a file called "courseproject.txt"

###Code Book
* The subject column is a numeric ID of the test subject.

* The activity column is a description of what the test subject was doing when the measurement was taken.

* All of the other columns are aggregated means of the particular measurement that was taken, grouped by activity and subject.
