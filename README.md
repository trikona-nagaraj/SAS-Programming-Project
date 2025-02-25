
# **Analysis of Guided Learning Hours in UK Colleges**


## Overview

This project analyzes variations in Guided Learning Hours (GLH) per learner across two types of UK educational institutions Further Education Colleges and Sixth Form Colleges. By examining factors such as institution type, size, region, and trends over three years, The goal is to uncover significant patterns that can inform policy decisions and optimize resource allocation within educational institutions. This project utilizes SAS (Statistical Analysis System) to perform a comprehensive analysis of GLH across these institutions, uncovering trends and relationships that can guide strategic decisions.


## **Table of Contents**

- [Introduction](#introduction)
- [Datasets](#datasets)
- [Methodology](#methodology)
  - [Data Import and Preparation](#data-import-and-preparation)
  - [Data Cleaning and Modification](#data-cleaning-and-modification)
  - [Anomalies Detection and Handling](#anomalies-detection-and-handling)
  - [Exploratory Data Analysis (EDA)](#exploratory-data-analysis-eda)
  - [Statistical Modeling](#statistical-modeling)
- [Results](#results)
- [Conclusions and Recommendations](#conclusions-and-recommendations)
- [Project Execution Snippets](#project-execution-snippets)



## **Introduction**

Guided Learning Hours (GLH) represent the time a student spends under the direct supervision of a teacher or tutor in a structured learning environment. Understanding how GLH varies across different institutions is crucial for enhancing educational outcomes and ensuring efficient resource allocation.

Further Education Colleges provide education for students aged 16 and older, often focusing on vocational and technical courses. Sixth Form Colleges primarily cater to students aged 16 to 19, offering academic qualifications like A-levels.


## **Datasets**

The analysis is based on two datasets Further Education Colleges Dataset, Sixth Form Colleges Dataset containing information on the total Guided Learning Hours (GLH) for learners across various regions of the UK. Both datasets are structured similarly but focus on different types of institutions. 

These datasets contains data for 9 regions across 3 years. The regions covered in this dataset include:

- East Midlands, East of England, London, North East, North West, South East, South West, West Midlands, Yorkshire and the Humber

Each datasets consists of 8 columns:

- Type of Institution: Further Education (FE) or Sixth form colleges
- Region: Specifies the geographical region of the institution.
- Total GLH (Guided Learning Hours) Year 1 : Represents the number of hours spent on teaching and learning activities.
- Number of Learners Year 1 : The count of learners in the educational institutions for the given year and region.
- Total GLH Year 2
- Number of Learners Year 2
- Total GLH Year 3
- Number of Learners Year 3



## **Methodology**




### **Data Import and Preparation**

Importing Datasets

- Used DATA, INFILE, and INPUT statements in SAS to read the data.

- Imported both datasets separately for Further Education and Sixth Form Colleges.

Merging Datasets

- Combined the two datasets into a single dataset using the SET statement.

- Ensured consistent variable naming and data types for seamless merging.

Data Summary:

- Used PROC PRINT to display the initial rows of the merged dataset for verification.


### **Data Cleaning and Modification**

Handling Missing Values

- Identified missing values using PROC MEANS and PROC FREQ and understand their distribution.

- Applied mean substitution for missing GLH values using IF statements and the MEAN function.

- Removed inconsistent data entries where necessary using the DELETE statement.

Creating New Variables

- Calculated the average GLH over three years using. ex: Average_GLH = MEAN(GLH_Per_Learner1, GLH_Per_Learner2, GLH_Per_Learner3);

- Created Total_GLH_Per_Learner by summing GLH across years. ex: Total_GLH_Per_Learner = SUM(GLH_Per_Learner1, GLH_Per_Learner2, GLH_Per_Learner3);
  
- Introduced a standardized Size variable to categorize institution sizes.

Data Verification:

- Used PROC CONTENTS and PROC MEANS to verify the structure and summary statistics of the cleaned dataset.



### **Anomalies Detection and Handling**

Univariate Analysis

- Assessed data distribution using PROC UNIVARIATE.

- Identified outliers through box plots (PROC SGPLOT).

Data Transformation

- Applied logarithmic transformation to normalize skewed data.

- Re-evaluated data distribution post-transformation to ensure normality.



### **Exploratory Data Analysis (EDA)**

Descriptive Statistics

- Generated summary statistics using PROC MEANS.

- Explored frequency distributions with PROC FREQ.

Visualization

- Employed PROC SGPLOT and PROC GCHART to create visual representations such as bar charts and scatter plots.
- Examined GLH per learner across different categories
- Investigated relationships between numerical variables using PROC CORR.


Insights Gained

- Observed inverse relationship between institution size and GLH per learner.

- Noted differences in GLH allocation between institution types and regions.




### **Statistical Modeling**

T-Test Analysis

- Examined the effect of institution type on GLH per learner using PROC TTEST.

- Determined statistical significance of observed differences.

ANOVA Analysis

- Assessed the impact of institution size and region using PROC GLM.

- Conducted post-hoc tests (Tukey's test) to identify specific group differences.

Assumption Checks

- Performed residual analysis to validate model assumptions.
- Used Q-Q plots and normality tests to confirm data suitability.


## **Results**

Key Findings:

- Institution Size: Found an inverse relationship between institution size and GLH per learner, indicating that larger institutions tend to allocate fewer guided learning hours per student.

- Institution Type: Sixth Form Colleges generally provide more GLH per learner compared to Further Education Colleges.

- Regional Variations: Detected significant differences in GLH allocation across different regions, suggesting regional policies or funding disparities.

- Yearly Trends: Observed changes in GLH over the three-year period, indicating possible shifts in educational strategies or funding over time.

Statistical Significance:

- The t-tests and ANOVA results showed statistically significant differences, confirming that the observed variations are unlikely due to chance.


## **Conclusions and Recommendations**

The comprehensive analysis of Guided Learning Hours (GLH) per learner across Further Education and Sixth Form Colleges in the UK reveals significant patterns that have practical applications for policymakers, educational institutions, and stakeholders.

#### Inverse Relationship Between Institution Size and GLH per Learner

Findings: The data shows a statistically significant inverse relationship between the size of an institution and the GLH allocated per learner. Larger institutions tend to offer fewer guided learning hours per student.

Practical Implications:

Resource Allocation: Larger colleges may face challenges in providing ample GLH due to higher student numbers and limited resources. This indicates a need for better resource management or increased funding.

Operational Strategies: Institutions can reassess their scheduling, class sizes, and teaching methods to optimize GLH without compromising quality.

Policy Adjustments: Educational authorities might consider revising funding formulas to account for the disadvantages larger institutions face in providing sufficient GLH per learner.

#### Differences Between Institution Types

Findings: Sixth Form Colleges generally provide more GLH per learner compared to Further Education Colleges. This difference is statistically significant, suggesting inherent differences in how these institutions operate.

Practical Implications:

Curriculum Design: Sixth Form Colleges often focus on academic qualifications like A-levels, requiring more instructional time. Further Education Colleges can evaluate if additional GLH would benefit their vocational programs.

Best Practices Sharing: Both institution types can collaborate to share effective strategies for maximizing GLH and enhancing student outcomes.

Targeted Support: Tailoring support based on institution type can ensure that each institution meets its learners' specific needs.

#### Regional Variations in GLH Allocation

Findings: Significant regional disparities exist in GLH per learner. Some regions consistently offer more guided learning hours than others.

Practical Implications:

Equity in Education: Regional differences may lead to unequal learning opportunities. Addressing these disparities is crucial for educational equity.

Policy Intervention: Policymakers should investigate the causes of regional variations, such as funding differences or demographic factors, and implement policies to balance GLH distribution.

Local Strategies: Institutions in regions with lower GLH can adopt innovative teaching methods or lobby for increased resources.

#### Yearly Trends and Anomalies

Findings: The analysis over three years shows varying GLH allocations, with certain years exhibiting significant deviations.

Practical Implications:

Monitoring and Evaluation: Continual assessment of GLH trends helps institutions adjust their strategies promptly.

Responsive Policies: Educational authorities need to be aware of yearly fluctuations to provide consistent support and address any emerging issues.



## **Project Execution Snippets**



![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/783ca30d-148f-4a48-8b65-db3bb80f10c9)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/ff1af3c0-87a1-4e4f-afb3-31cf0255c3f5)


### 5. Statistical Modelling 📈
   - T-test, ANOVA analysis on different factors affecting GLH per learner

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/571f2864-3c3a-4994-a6dc-96742322f49a)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/e1456f20-a2f7-4069-a94a-3730c7750c1a)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/4a119e35-0e37-4b5f-bbde-b084a5c89a7c)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/128ce757-6a19-4c7c-9235-aebb2b72be30)


## Results  📝

The detailed analysis presents significant findings:

- Effect of Institute Type and Size on GLH per learner
  
![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/5a013e4b-730f-4e93-b375-2a481f069764)

•	Summarizing the above information, we can state that there is an inverse relationship between the institute type and size with the total GL hours needed. However, we find a contrary in small-size institutes, though sixth form colleges are more in number high GL hours needed for a single learner than FE colleges learner.

  
- Effect of Region and Year on GLH per learner

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/06fd5add-5b0e-42aa-b4a1-3c8b02d055ed)

•	Summarizing the above information, we can say that a few regions needed more learning hours in year 3 but some decreased in the 3rd year. Every region had low learning hours needed in year 1.


- Effect of Institute Type on GLH per learner

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/52605ce9-f45d-4d91-bd1b-50d65907bb0d)

The scatter plot shows that there is a variation in the two groups and sixth form college has low variance. The box plot depicts the data to median and mean overlap in FE colleges and half of the data in sixth form li below the median. 
• Summarizing the above results state that there is a difference between the two variables and FE colleges mean is greater than Further education college by 1.06 as this may be due to lack of data of the sixth form colleges.


- Effect of ‘REGION’ on GLH per learner



![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/88078e61-20c1-40ef-bf3d-4984699865bf)

![image](https://github.com/trikona-nagaraj/Guided-Learning-Hours-Analysis-in-Further-Education-and-Sixth-Form-Colleges/assets/78613343/5121130a-107a-473b-8ea1-ca92847d967c)

There are 9 regions where the colleges are spread among which ‘South East’ and ‘North West’ regions have a higher number of observations and the scatter plot shows that ‘East Midlands’ and ‘South West’ regions there are a minimum number of observations. And the box plot shows that the mean for each region is above the median and they do not overlap except for ‘South West’ region. 


