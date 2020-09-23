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

# AI for Medical Treatment #

## Week 2 - Medical Question Answering 

### Resources

- Grad-CAM Method
    - paper - https://arxiv.org/pdf/1610.02391.pdf
    
- Random Forest + Permutation Importance 
    - paper - https://www.stat.berkeley.edu/~breiman/randomforest2001.pdf

- Shapley Value Importance
    - paper - https://arxiv.org/abs/1905.04610
    
- Datasets
    - General Domain (SQuAD)
    - Biomedical Domain (BioASQ)

### Natural Language Processing
1. Non-Contextualized Word Representation
    - Word2Vec
    - GloVe
    
1. Contextualized Word Representation
    - ELMo
    - BERT
    
- NLP questions are trained from General Domain then fine-tune further on biomedical domain

#### Patterns and Automatic Labeling
- Known Rules
    1. Regex Rules
    1. Dependency Parse Rules
        - dependencies among grammatical unit
    1. Negation Classification
        - a type of Supervised Learning
        
#### Evaluation Label Extraction
- Evaluate quality of extractions
    - Ground Truth in labels 
        - provided by `experts`
            - e.g. 
                - annotate radiology reports 
                - annotate x-ray reports
- Metrics
    1. Precision
    1. Recall 
    1. F1 
    