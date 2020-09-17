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

## Week 4 - Risk Models using linear and tree-based models

### Hazard and Survival Functions

#### 1. Accumulative Hazard  
- Overview 
    - can be use to create the survival function
- Properties
    - `bath tub curve`
        - e.g. risk increase immedately after surgery then decline then increases as time goes on
- Notation
    - Accumulative Hazard Formula
        \begin{align}
        S(t)=exp(\int_0^t \lambda(u) du) 
        \end{align}

    - Survival to Hazard Formula
        \begin{align}
        \lambda(t) = - \frac{S^{'(t)}}{S(t)}
        \end{align}

   `interpretation`: the hazard is rate of death if age t

- Comparison
| | Survival function | Hazard Function | Accumulated Hazard Function |
| --- | --- | --- | -- |
| Questions | What is the probabilty of survival past any time t? | What is a patient's `immediate risk of death` if they make it to time t? | What is the patients accumulated hazard upto time t? | 
| Formula | $ S(t) = Pr(T>t) $ | $ \lambda (t) = Pr(T = t| T \ge t) $ | $ \Lambda(t) = \sum_{i=0}^t \lambda(i) $ | 


#### 2. Cox Proportional Hazard
- Overview 
    - comparing the risk of different patients using own patient profile
        - specific to particular patient profile
        - individualize survival model

- Notation
    - Formula 
        \begin{align}
        \lambda(t,x) = \lambda_0(t) \times exp(factor)
        \end{align}
        
        where $ \lambda_0 $ is baseline risk which is based on the hazard curve for the population and is always $ \ge 0 $
    
    - Derivation 
        \begin{align}
        \lambda(t,x) & = \lambda_0(t) \ exp(0.08 \times smoker + 0.01 \times age) \\
        & = \lambda_0(t) \ exp(\beta_1 \ \ \ \times X_1 \ \ \ \ \ \ \ + \beta_2 \ \ \ \times \  X_2 ) \\
        & = \lambda_0(t) \ exp(\beta_1X_1 + \beta_2 X_2 \ldots ) \\
        & = \lambda_0(t) \ exp(\sum_{i=0} \beta_i X_i ) \\
        \end{align}
        where `exp` is Euler number which is natural language of growth 
        
    - Vectorized Implementation 
    
        \begin{align}
        \lambda(t,x) & = \lambda_0(t) \ e^{(\theta^T X_i)} \\
        \lambda(t,x) & = \lambda_0(t) \ e^{(\theta X_i^T)}
        \end{align}
        
        where $ \theta^T or X^T $ is the tranpose row vector 
        
    - Numpy Convention
    
        \begin{align}
        lambdas = lambda_{0} * np.exp(np.dot(coef,X.T))
        \end{align}
        
        where $ \theta $ is the coefficient 
        
    - Example 
        
        Data
        
        |     | Age <br/> $ X_1 $ | Cholesterol <br/> $ X_2 $ |
        | --- | --- | --- |
        | 0  | 20   | 123 |
        | 1  | 21   | 100 |
        | 2  | 22   | 102 |
        | ... | ... | 90  |
        | 40 | 40   | 130 |
        
        | Variable <br/> $ X_i $ | Weight <br/> $ \beta $ | 
        | --- | --- |
        | Age | 0.01 |
        | Is_smoker| 0.10 |
       
        Variables 
        
        \begin{align}
        \theta^T & = [ 0.01, 0.10 ]
        \\
        \\
        X_{1} \times X_2 & = \begin{bmatrix} 
         20 & 123 \\
         21 & 100 \\
         22 & 102 \\
         \ldots & \dots \\
         40 & 130 \\
        \end{bmatrix}
        \end{align}
    
    - Properties 
        
        | Variable <br/> $ X_i $ | Weight <br/> $ \beta $ | exp(Weight) <br/> exp($ \beta $) |
        | --- | --- | --- |
        | Age | 0.01 | 1.01 |
        | HDL | -0.07 | 0.93 |
        
        1. if exponent of weights or exp($ B $) > 1 = `risk factor increasing`
            - if $ B $ is positive, `np.exp() of postive number is always > 1`
            - e.g. As age increase by 1 unit, the risk increases 
                
                \begin{align}
                \lambda(51,age) & = \lambda_0(t) \ exp(0.01 \times 50) \\
                \lambda(50,age) & = \lambda_0(t) \ exp(0.01 \times 51) \\ 
                \\
                \frac{ \lambda(51,age)} {\lambda(50,age)} & =
                \frac{  exp(0.01 \times 50)  }{ exp(0.01 \times 51)   } \\
                \\
                \lambda_1(t) & = 1.01
                \end{align}
                
                `interpretation`: for every 1 unit change of age, risk factor increases by 1.01
                
                \begin{align}
                \lambda_{age}(51)  = \lambda_{age}(50) \times 1.01
                \end{align}
                
        1. if exponent of weights or exp($ B $) < 1 = `risk factor decreasing` 
            - if $ B $ is negative, `np.exp() of negative number is always < 1`
            - e.g. As HDL increase by 1 unit, the risk decreases 
            
                \begin{align}
                \lambda_{HDL}(10)  = \lambda_{HDL}(9) \times 0.93
                \end{align}
        
#### 2. Survival Trees 
- Overview
    - can take patient variables into account to compare risk of different patients
    - are like binary decision trees
    - can model non-linear relationships
        - e.g. Pneumonia Hazard 
            - young age = high risk
            - middle age = low risk
            - old age = high risk
