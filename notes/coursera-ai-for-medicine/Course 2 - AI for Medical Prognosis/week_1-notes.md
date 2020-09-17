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

# AI for Medical Prognosis #

## Week 1 - Linear Prognostic Models

### Resources
- Chads-Vasc Risk Score
    - link - https://journal.chestnet.org/article/S0012-3692(10)60067-0/fulltext
- MELD's Score
    - link - https://aasldpubs.onlinelibrary.wiley.com/doi/full/10.1002/hep.21563
- ASCVD + 
    - link - https://www.ahajournals.org/doi/full/10.1161/01.cir.0000437738.63853.7a

### Prognosis Overview 
- Use Cases:
    1. predicting future events
        - heart attack
        - death
        - stroke
    1. informing patients
        - risk of illness
        - survival with illness
        - guiding treatment
        - 6-month mortality risk

### Prognosis in Medical Practice 

1. Atrial Fibriliation
    -  $ CHA_2DS_2-VASc $ ("`Chads Vasc`" Score)
        - for patients with Atrial Fibriliation and prognosis of `1-year risk of stroke`

    |     | Profile | Coefficient | Value | Coefficient <br/> x Value |
    | --- | --- | --- | --- | --- |
    | C  | Congestive Heart Failure | 1 | 0 | 0 |  
    | H  | Hypertension             | 1 | 1 | 1 |  
    | A₂ | Age 75 years or older    | 2 | 0 | 0 |  
    | D  | Diabetes Mellitus        | 1 | 1 | 1 |  
    | S₂ | Stroke, TIA, or TE       | 2 | 0 | 0 |  
    | V  | Vascular disease.        | 1 | 0 | 1 |  
    | A  | Age 65 to 74 years.      | 1 | 1 | 1 |  
    | Sc | Sex category (female)    | 1 | 0 | 1 |  
    |    | Risk Score               |   |   | 3 |  

1. Liver Disease Mortality 
    - `MELD Score` ("Model for End-stage Liver Disease")
        - one factor that determines how quickly patient might get a liver transplant
        - provides estimate of 3-month mortality 
            - for patients for patients > 12 on liver transplant waiting lists
        
1. Risk of Heart Disease
    - `ASCVD Risk Estimator` ("Atherosclerotic Cardiovascular Disease")
    - 10-year risk of heart disease
        - for patients for patients > 20 who do not already have heart disease 

### Risk Equations
1. Interactions or Combined Features 
    - can include `interaction terms` (i.e. combining profiles or variables)
        - e.g.  $ age \times ln BP \times Coefficient_{Age,BP}  $
    - may not always be linear (i.e. natural log)
    
### Evaluation of Prognostic Model

#### 1. C-Index 
- Overview
    - measures how good the prognostic models
    - `does not` allow censored observation
    
- Formula
    \begin{align}
        C-index = \frac{\#(concordant\ pairs) + 0.5 \times \#(risk\ ties)}{\#(permissible\ pairs)} 
    \end{align}
    
- Constant 
    - +1.0 for a permissible pair that is concordant
    - +0.5 for a permissible pair for risk tie
    
- Properties
    - Random model score would score = 0.5
    - Perfect model score would score = 1.0
    
- Interpretation 

    \begin{align}
     P(score(A) > score(B) | Y_A > Y_B) 
    \end{align}
    
    `interpretation`: What is the probability that patient with worst outcome (i.e. Patient A) gets the higher risk score (i.e. score(A))

    
    
- Data Categories    

    1. Permissible Pair
        - a pair where outcomes are  different
    
    | | Patient A | Patient B |
    | --- | --- | --- |
    | Died within 10 Years | Yes  | No  |
    | Risk Score           | 0.7  | 0.8 |
    
    1. Concordant
        - patient with worst outcome with higher risk score

        | | Patient A | Patient B |
        | --- | --- | --- |
        | Died within 10 Years | Yes  | No   |
        | Risk Score           | 0.95 | 0.43 |

    1. Discordant
        - patient with worst outcome does not have high risk score

        | | Patient A | Patient B |
        | --- | --- | --- |
        | Died within 10 Years | No   | Yes  |
        | Risk Score           | 0.95 | 0.43 |

    1. Risk Ties

        | | Patient A | Patient B |
        | --- | --- | --- |
        | Died within 10 Years | Yes | No  |
        | Risk Score           | 0.7 | 0.7 |

    1. Ties in Outcome

        | | Patient A | Patient B |
        | --- | --- | --- |
        | Died within 10 Years | Yes  | Yes  |
        | Risk Score           | 0.94 | 0.65 |
    
    
- Example

    | Patient | Events | Risk |
    | --- | --- | --- |
    | A | Yes | 0.8  |
    | B | No  | 0.43 |
    | C | Yes | 0.62 |
    | D | Yes | 0.58 |
    | E | No  | 0.62 |
    
    - Permissible pairs
        - (A,B), (A,E), (B,C), (B,D), (C,E), (D,E)
        
    - Concordant pairs
        - (A,B), (A,E), (B,C), (B,D)
        
    - Risk Ties
        - (C,E)
        
    - Computation
        - $ C-index = \frac{4+0.5 \times 1}{6} $