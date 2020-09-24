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
    - Library
        - [SHAP for Tree Ensembles](https://arxiv.org/pdf/1802.03888.pdf)
         
- Steps
    1. Load Data
        1. Split whole set into Dev and Test (80/20) sets
            1. Split the Dev set into Training and Validation (75/25) sets
    1. Explore Data Analysis (EDA) for the Training set
        - For Data Analysis
            1. Explore Data
                1. Headers
                1. Shape and data types
            1. Assess if for Missing Data
                - Plot heatmap of `training` and `validation` data using all headers
                    - if Few: Proceed
                    - if Many:
                        1. Compute the fraction of missing data
                        1. Perform Complete Case Analysis
                            1. Drop Method
                                - drop the data with missing values for **training and validation** data
    1. Build the Decision Tree Model using the `dropped` **train and validation** data
    1. Evaluate the model using `C-Index`
        - if Not Overfitting: Proceed
        - if Overfitting:
            - Perform Hypertuning parameters
    1. Build the Random Forest Model using the `dropped` **train and validation** data
        1. Implement Forest Grid Search
    1. Evaluate the Random Forest Model using `C-Index` on **test** data
    1. Evaluate the Performance of Model
        1. Assess if Dropping for Missing Data was the cause
            - Plot distribution for `full` (i.e with and without missing data) and `without` missing data for training set using all headers
                1. Classify the type of Missing Data Category 
                1. Perform Error Analysis
                    1. find the population with c-index below the result in Step 6.
                    1. Perform different methods of Imputation for missing values
                        1. Implement Mean Subsititution on **train** data
                            1. Repeat Step 5.A - Forest Grid Search using `mean_imputed` **train, validation, test** data
                        1. Implement Multivariate Feature Imputation on **train** data
                            1. Repeat Step 5.A - Forest Grid Search using `feature_imputed` **train, validation, test** data
                    1. Compare the result of the different Imputation Approaches
                        - `dropped` vs `mean_imputed` vs `feature_imputed` data
    1. Explain the Results of Predictions
        1. Perform `SHAP Values`

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
        1. Split Train and Test
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
    1. Evaluate the model using `C-index` 
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
        1. Split Train and Test
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