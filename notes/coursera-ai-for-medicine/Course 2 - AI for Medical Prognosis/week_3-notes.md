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

## Week 3 - Survival Models and Time

### Resources

- Survival Analysis Library (Lifeline)
    - link - https://lifelines.readthedocs.io/en/latest/
    - paper - http://www.medicine.mcgill.ca/epidemiology/hanley/c634/lifetables/abm_17.PDF
    

- Dataset 
    - link - https://www.statsdirect.com/help/content/survival_analysis/logrank.htm
    
### Survival and Hazard Models 
- known models
    1. Kaplan Meier
    1. Cox 
    1. Multiple Cox
    1. Nelson-Aelen estimator 

#### 1. Kaplan Meier Estimate  - Survival Estimator
- Overview
    - estimates from population
    - takes censored information into account
    - survival function is applied to patient in the population
        - not specific to particular patient profile
        - not individualize survival model

- Properties
    1. survival probability should never go up 
    1. survival probability starts as 1 and eventually gets to 0
    
- Notation
    \begin{align}
    S(t) & = \left\{ 
        \begin{matrix}
        1 \ if \ t & = 0 \\
        0 \ if \ t & = \infty 
        \end{matrix} 
    \right\}  \\ \\
    S(t) & = Pr(T > t)
    \end{align}

    \begin{align*}
    \end{align*}

    - The `Law of conditional probability` expands the Overview of Survivability

    \begin{align}
        P(A \cap B) & = P(A|B)P(B) \\
        P(A, B, C)  & = P(A|B,C)\ P(B|C)\ P(C) \\
    \end{align}

    - Chain rule of conditional probability applied to Survival Model

    \begin{align}
    S(25) & = Pr(T > 25) \\ 
          & = Pr(T \ge 26, T \ge 25, \ldots, T \ge 0 ) \\
          & = Pr(T \ge 26|T \ge 25) Pr(T \ge 25| T \ge 24) \ldots 
          P(T \ge 1| T \ge 0)P(T \ge 0)
    \end{align}

    since

    \begin{align}
    Pr(T \ge 26| T \ge 25) & = 1 - Pr(T=25|T \ge 25)  \\
    Pr(T \ge 25| T \ge 24) & = 1 - Pr(T=24|T \ge 24) \\ 
    \ldots \\
    Pr(T \ge 1| T \ge 0) & = 1 - Pr(T=0|T \ge 0) \\ 
    \end{align}

    therefore 
    \begin{align}
    S(25) = (1 - Pr(T=25|T \ge 25))\ (1 - PR(T=24|T \ge 24)) \ldots (1 - PR(T=0|T \ge 0))
    \end{align}

- Derived Formula
    \begin{align}
    S(t) & = \prod_{i=0}^t 1 - Pr(T=i|T \ge i) \\
    \end{align}
    
    simplified
    \begin{align}
          P(T = 25| T \ge 25) & = \frac{\#(died \ at \ 25)}{\#(known \ survived \ to \ 25)}
    \end{align}
    
    short hand notation
    \begin{align}
    S(t) & = \prod_{i=0}^t 1 - \frac{d_i}{n_i}
    \end{align}
    
    - Example
    
    | i | $ T_i $ |
    | --| -- |
    | 1 | 10 |
    | 2 | 8+ |
    | 3 | 60 |
    | 4 | 20 |
    | 5 | 12+|
    | 6 | 30 |
    | 7 | 15+|
       
    \begin{align}
        S(25) =& (1-Pr(T=25|T \ge 25))(1-Pr(T=24|T \ge 24)) \ldots (1-Pr(T=0|T \ge 0))
    \end{align}
    
    since the only T less than 25 are t=[10,20] (death that occured before T=25) and 10
    
    \begin{align}
        S(25) & = (1-Pr(T=20|T \ge 20))(1-Pr(T=10|T \ge 10)) 
    \end{align}
    
    derived
    
    \begin{align}
          P(T = 20| T \ge 20) & = \frac{\#(died \ at \ 20)}{\#(known \ survived \ to \ 20)} \\
          P(T = 10| T \ge 10) & = \frac{\#(died \ at \ 10)}{\#(known \ survived \ to \ 10)} \\
          S(25) & =  \left( \frac{\#(died \ at \ 20)}{\#(known \ survived \ to \ 20)} \right)
                     \left( \frac{\#(died \ at \ 10)}{\#(known \ survived \ to \ 10)} \right) \\
          S(25) & = \left( 1 - \frac{1}{3} \right) \left( 1 - \frac{1}{6} \right) \\
          S(25) & = 0.56
    \end{align}
    
    `note`: **censored data** or data with '+', do not equate to `death` 
     (i.e. **+20** $ \ne $ died at 20)
        
- Survival Data
    - types of data
        - actual events within timeframe
        - censored data
            - withdrawn/dropped out
            - study ends
    - key challenges and feature of survival analys
        - right censoring data
            - a type of missing data problem
            - right censored observations
                - time to event is only known to exceed a certain value
            - _`categories`_ of censoring
                1. **end-of-study** censoring
                1. **loss-to-follow-up** censoring
    - example
        - Treatment Given to Stroke Event
        
