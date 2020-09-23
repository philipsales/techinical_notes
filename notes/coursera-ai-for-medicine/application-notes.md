---
jupytext:
  text_representation:
    extension: .md
    format_name: myst
kernelspec:
  display_name: Python 3
  language: python
  name: python3
---
(ai_in_medicine)=

# AI for Industry #

## Building Tree-Based Risk Models
- Practical Application
    - Title
        - `10-year risk of death of individuals`
    - Algorithm 
        - Random Forest 
    - Dataset
        - [NHANES dataset](https://wwwn.cdc.gov/nchs/nhanes/nhanes1/])
        - [NHANES reference](https://wwwn.cdc.gov/nchs/nhanes/nhefs/)
         
- Steps
    1. Load Data
    1. Explore Data Analysis (EDA)
        - For Data Analysis
            1. Assess if for Missing Data
                1. Case Analysis
                1. Imputation
    1. Build the Decision Tree Model using train data
    1. Evaluate the model using 
    1. Evaluate the model using the Test Sets 
    1. Improve the Model 
    1. Explain the predictions using `Shap`

## Building Linear Risk Models
- Practical Application
    - Title
        - `Risk Score Model for Retinopathy for Patient with Diabetes`
    - Algorithm 
        - Logistic Regression
    - Dataset
        - Synthetic 
    
- Steps
    1. Load Data
    1. Explore Data Analysis (EDA)
        - For Data Analysis
            1. Assess if for Normal Distribution
                - Plot histogram
                    - if Yes: Proceed
                    - if No: 
                        1. Log Transformation
                        1. Standardization
                            - Mean-Normalization
                                - Get mean and standard deviation of train data, and use the traning mean and sd to transform the test data
    1. Build the Logistic Regression Model using train data
    1. Evaluate the model using C-index metric
        - Evaluation of Medical `Prognostic` Models
            - C-index 
    1. Evaluate the model using the Test Sets 
        1. Compute for model coefficient
    1. Improve the Model 
        - Improve Medical `Prognostic` Models
            1. Add Interaction Terms
                1. Combine Features
    1. Evaluate the improve the Model 
        - Compare before and after of model

## Boilerplate Steps
- Steps
    1. Load Data
    1. Explore Data Analysis (EDA)
        - For Image Analysis
            1. Check Data Types
            1. Check Null Values
            1. Check Unique IDs
            1. Check Data Labels
            1. Visualize Limited Images
            1. Investigate single image for meta-data
            1. Investigate single image for pixel value distribution
                - Plot histogram
                    - if Yes: Proceed
                    - if No:
                        1. Apply Image Preprocess
                            1. Standardization
                        1. Replot the Pixel Distribution of before and after preprocessing 
        - For Data Analysis
            1. Assess if for Null Values 
            1. Assess if for Patient Overlap 
            1. Assess if for Imbalance Class 
            1. Assess if for Data Leakage
            1. Assess if for Normal Distribution
                - Plot histogram
                    - if Yes: Proceed
                    - if No: 
                        1. Log Transformation
                        1. Standardization
                            - Mean-Normalization
                                - Get mean and standard deviation of train data, and use the traning mean and sd to transform the test data
    1. Build the model using train data
    1. Evaluate the model using metrics
        - Evaluation of Medical `Diagnostic` Models
            - Confusion Matrix
            - Accuracy
            - Prevalence
            - Sensitivity(Recall) and Specificity
            - PPV(Precision) and NPV
            - ROC Curve 
            - Confidence Interval
            - Precision-Recall Curve
                - for imbalance Classes
            - F1 Score
            - Calibration
        - Evaluation of Medical `Prognostic` Models
            - C-index 
    1. Evaluate the model using the Test Sets 
        1. Compute for model coefficient
    1. Improve the Model 
        - Improve Medical `Prognostic` Models
            1. Add Interaction Terms
                1. Combine Features
        - Improve Medical `Diagnostic` Models
            1. Calibration
    1. Evaluate the improve the Model 
        - Compare before and after of model