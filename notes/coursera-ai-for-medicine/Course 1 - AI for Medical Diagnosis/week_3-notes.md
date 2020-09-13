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

# AI for Medical Diagnosis #

## Week 3 - Image Segmentation on MRI


- 3D Brain MRI 
    - paper - https://arxiv.org/pdf/1902.09063.pdf
    - dataset -   https://decathlon-10.grand-challenge.org/
- 3D U-Net
    - paper - https://arxiv.org/abs/1606.06650
- 2D U-Net
    - paper -  https://arxiv.org/abs/1505.04597
- Medical Segmentation Decahlon
    - link - https://decathlon-10.grand-challenge.org/


### Image Segmentation
1. Soft Dice Loss
    - popular Loss Function for segmentation models
    
    \begin{align}
    L(P,G) = 1 - \frac{2 \sum_i^n p_i g_i}{\sum_i^n p_i^2 + \sum_i^n g_i^2}
    \end{align}

    where 
        - P: Predicted
        - G: Ground Truth

### Challenges of AI in Actual Settings
1. Generalisability
1. External Validation
    - to measure the generalization of model on a population that haven't seen
    - evaluate test set from new population
        - problem: model not generalizing to new population
        - solution: get few more samples to create training and validation set then fine tune the model
        
| Retrospective (Historical) Data |  Real-World (Prospective) Data |
| --- | -- |
| most studies and models are based in this data | for practical application in real-world |
| can be cleaned and pre-processed | model must work in raw data |
| based on previous records | trained model as data is coming in |


1. Measuring Patient Outcomes

    - Model based Metrics
        - measuring performance of model 
        - e.g. 
            - AUROC
            - DICE Score
    - Patient based Metrics
        - measuring performance based on patient outcomes
        - e.g.  
            - Decision Curve Analysis
                - quantify net benefit of model
            - Randomized Controlled Trials
                - compare patient outcomes on applied AI vs non-applied AI  
                
1. Model Interpretation
    - better understanding of how these algo interact with the decision making of clinicians
    - difficult to understand inner workings of models to understand how and why it makes its decision