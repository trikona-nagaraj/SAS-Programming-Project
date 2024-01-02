---

# Guided Learning Hours Analysis in Further Education and Sixth Form Colleges

## Summary
The project revolves around a detailed analysis conducted on guided learning hours per learner across two distinct types of UK educational institutions: Further Education (FE) colleges and Sixth Form colleges. The analysis encompasses several crucial stages, beginning with data import, merging, data cleaning, anomaly detection, exploratory data analysis (EDA), and culminating in relevant statistical modeling to derive meaningful insights.

## Major Insights 📊
The analysis primarily focuses on examining guided learning hours per learner concerning various factors, such as region, institution type, size, and three-year data for each institute. It identifies an inverse relationship between the institute type and size with the total guided learning hours needed. However, an interesting contradiction is observed in small-size institutes, where sixth form colleges, despite being more numerous, require higher GLH (guided learning hours) for a single learner than FE colleges' learners.

## Methods Implemented 🛠️
### 1. Data Import 📥
   - Commands utilized: DATA, INFILE, DSD, DLM, FIRSTOBS, MISSOVER, INFORMAT, INPUT, LABEL, SET, IF statement, PROC PRINT, etc.
### 2. Data Cleaning 🧹
   - Handle missing values
   - Calculate average GLH for three years
   - Introduce variables: Average Glh hours, Glh per learner, Total Glh per learner, Size (of the institute)
### 3. Anomalies Detection and Handling 🕵️‍♂️
   - Identify extreme values in the data
   - Normalize data using log transformation
### 4. Exploratory Data Analysis (EDA) 📊
   - Summarize dependent and independent variables
   - Analyze GLH per learner by institute type and size, effect of region and year on GLH per learner
### 5. Statistical Modelling 📈
   - T-test, ANOVA analysis on different factors affecting GLH per learner

## Results and Conclusions 📝
The detailed analysis presents significant findings:

- Effect of Institute Type and Size on GLH per learner
  
![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/2c7fadc1-ffaf-4d24-a4ed-0fc45cb861ef)

  
- Effect of Region and Year on GLH per learner


![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/75c21c72-9323-4586-8d36-a490a502ed02)

  
- Statistical models showcasing relationships between various factors

* Effect of Institute Type on GLH per learner

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/0a474789-6ded-4174-951c-27fd0b5346a8)

The scatter plot shows that there is a variation in the two groups and sixth form college has low variance. The box plot depicts the data to median and mean overlap in FE colleges and half of the data in sixth form li below the median. Summarizing the above results state that there is a difference between the two variables and FE colleges mean is greater than Further education college by 1.06 as this may be due to lack of data of the sixth form colleges.



Concluding remarks emphasize the inverse relationship between institute type and size with total GLH needed, while also highlighting regional variations in learning hours across different years. Statistical models demonstrate correlations but reveal non-normality in the data.

## Supporting Evidence 📝

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/02d0bbeb-6599-4348-b9fd-521d52e4cda8)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/429c1744-e0e5-41d1-99cc-3d25fef0a948)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/34bd970c-dc57-47da-9eb7-dc8e514d7d79)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/3055d229-1b5e-4ec0-a163-b857dfe69fd6)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/c9c97a6f-4dab-4b19-be44-10018d6af2fb)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/ce070c36-1147-4f5f-8c5d-0495cf729aac)



---

