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
(machine_yearning)=

# Machine Yearning #

## Machine Learning Progress Drivers 
- Data availability
- Computational scale
    - even as you accumulate data, performance of older learning algorithms such as logistic regression `plateaus` - stops improving
    - Neural network (deep learning) improves better


## Development and Test sets 

- conventional rule of 70% (training set) and 30% (test sets)
    - bad idea where training distribution is different from actual

1. Different sets
    - Traning set
        - where you run the algorithm on
    - Development set (`hold-out cross validation set`)
        - where you tune parameters, select features, choose algorithm
    - Test set
        - evaluate performance of algorithm but not make any fine tuning

- choose the dev and test sets that reflects data expected in the future to do well

## Sets Distribution 

- if the dev and test sets come from the `same` distribution
    - problem:
        - overfitting
            - remedy is to get more dev set
- if the dev and test sets come from the  `different` distribution
    - problem:
        - overfit dev set
        - test set is harder than dev set
            - algo might doing well as expected, and no further significant improvement is possible
        - test set is bit different from dev set
            - doesn't work well on test set, lot of work to improve dev set is wasted
- `Recommended`: if goal is to make progress in ML application: use same distribution of sets


## Size of Dev/Test sets 
1. Dev set
    - large enough to detect the difference between chosen algo
    - `Common`: Dev sets from  1,000 to 10,000 
        - can detect improvement of 0.1%
            - can be calculated by statistical difference
1. Test set
    - large enough to give high confidence in overall performance
    - `Popular`: heuristics use 30% of data for test
        - works well for 100 to 10,000 examples
        - if big data, percentage is sinking or less than 30%

## Single Number Evaluation Metric 
1. Classification accuracy  
    - (precision, recall) - use combined metric which is F1

## Optimizing and Satisficing Metrics 
- adjusting the metrics (optimizing) by inserting the user defined criteria (satisficing) 
    - e.g. Accuracy - 0.5 x running time
    - e.g. false negative rate (optimizing metric) 
           one false negative in 24 hours of operations (satisficing)



## Development Set and Metrics Iterations 
- When buidling ML system
    1. Start with some idea on how to build
    2. Implement idea in code
    3. Carry out an experiment
    4. Iterate

## When to Change Dev/Test Sets and Metrics 
- come up with dev/test and initial metrics in less than 1 week
- if initial dev/test set or metric missed the mark - change quickly
Possible reasons set/metric are incorrect
1. The actual distribution is different from dev/test sets
2. Overfit to the dev set
    - when dev set performance is better than test sets
        - solution: get a fresh dev set
    - happens when repeatedly evaluating ideas on the dev set
    - `do not` use the test sets to make any decisions regarding the algorithm, including roll back to previous week's system
3. The metric is measuring something other than what the project needs to optimize
    - common to change dev/test sets or evaluaton metrics

## Takeaways of Settting up Dev/Test Sets 
- choose dev and test sets from distribution that reflects the actual distribution, may not be the ame with training data's distribution
- choose dev and test sets from same distribution if possible
- choose single-number evaluation metric
- iterate dozens of ideas
- iterate faster
- establish dev/test sets and metric in 1 week
- 70% (train) / 30% (test) heuristics does not apply if have lots of data
- dev set should be large enough to detect meaningful/significant changes - but not necesarilty large
- test set should be large enough to give confident estiamte


## Basic Error Analaysis #

## Build first system quickly, then iterate 
- build basic system quickly rather than perfectly

## Error Analysis: Look at dev set examples to evaluate ideas 
- Error analysis
    - process of looking at misclassified examples in `dev sets` to understand underlying causes of errors

## Evaluating Multiple ideas in parallel during error analysis 
- do excel matrix with `error categories` as columns and the misclassified examples as rows. Then add comments as column for the text on manual checking
- select which among the error categories yield the highest changes when optimize.


## Cleaning Mislabeled dev and test sets example 
- `mislabeled` means human labeler made mistakes before the algo encounter the data
- add additional column in error categories as `mislabled`, 
    - if the fraction of mislabeled examples are significant
        - fix the dev sets and test sets too if drawn from same distribution 
        - `bias` is fixing only labels of examples that your system misclassificed

## If you have a large dev set, split into 2 subsets, only one of which you look at 
- larger datasets takes longer time to manually examine. 
- do not use all in error analysis - so split into 2
- you will rapidly overfit the portion you are amnually looking at, so use the other portion to tuen parameters
- `Eyeball dev set` the dataset that will be manually examined
- `Blackbox dev set` the remaining unexamined dataset
    - can be use to evaluate algo (e.g classifier algo) by measuring their error raties
    - can be use to tune hyperparameters
    - do not look the dataset manually
    ```
    Why do we explicitly separate the dev set into Eyeball and Blackbox dev sets? Since you will gain intuition about the examples in the Eyeball dev set, you will start to overfit the Eyeball dev set faster. If you see the performance on the Eyeball dev set improving much more rapidly than the performance on the Blackbox dev set, you have overfit the Eyeball dev set. In this case, you might need to discard it and find a new Eyeball dev set by moving more examples from the Blackbox dev set into the Eyeball dev set or by acquiring new labeled data. Explicitly splitting your dev set into Eyeball and Blackbox dev sets allows you to tell when your manual error analysis process is causing you to overfit the Eyeball portion of your data.
    ```

## How big should the `Eyeball` and `Blackbox` dev sets 

`Eyeball dev set size`
- should be large enough to give sense of algo's major error categories
    Rough Guidelines for `task that humand do well`: 
    - 10 errors - too few
    - 20 errors - rough sense of error sources
    - 50 errors - good sense of error sources
    - 100 errors - very good sense of error sources

*`Note:`* **the lower the error rate, the large the Eyeball dev set in order to get a large enough sets of errors to analyze**

`Blackbox dev set size`
- `common`: 1,000 - 10,000, 100 would be small but still useful
- if small dev set, use all as Eyeball dev set
    - but risk of overfitting

## Takeaways: Basic Error analysis 
- don't start by designing and building perfect system
- build and iterate as quickly - few days
- use error analysis manually ~ 100 dev set examples
- use `error anlaysis` matrix 
- split into Eyeball and Black dev set for the manual error analysis
- Eyeball dev set should be large enough to give sense of algo's major error categories
- if small dev set, use all as Eyeball dev set

## Bias and Variances #

## Bias and Variances: Two big sources of error 
- dev/test sets performance is usually worse than training set performance
- `algorithm bias` - error rate on *training set* when you have very large training set
- `algorithm variance` - how much worst on dev/test compared training set

## Examples of Bias and Variance 
1. `overfitting`
    - high variance 
        - low training set error and high dev set error
        - e.g. Training error (1%) Dev error (11%)
1. `underfitting`
    - high bias 
        - dev error barely higher than training 
        - e.g. training error (15%) Dev error (16%)

## Comparing to the optimal error rate 
1. `optimal error rate` (unavoidable bias)
    - acceptable benchmark of error based on literature
1. `avoidable bias`
    - difference between training error and optimal error rate
1. `variance`
    - difference between dev and training error rate

`Bias` = Optimal error rate + avoidable bias

*`Note:`* **all variance is avoidable with a sufficiently large dataset, so there is no unavoidable variance**

*`Note:`* **Optimal error rate is `Bayes error rate` in statistics**

## Addressing Bias and Variance 
1. if high avoidable bias
    - increase size of model (neural network layers/neurons)
        - may increase variance
        - will have computational problems/limits
        - will have risk of overfitting when not using regularization
1. if high variance
    - add data to training set

*`Note:`* **If increase neural network size and data without limit, possilbe do have very well results**

## Techniques for reducing avoidable bias 
1. increase the model size (neurons/layers)
    - reduces bias since it allows to fit the training set better
        - must use regularization to eliminate increase in variance
1. modify input features based on insights from error analysis
    - could increase variance so use regularization
1. reduce/eliminate regularization
    - reduce avoidable bias, but may increase variance
1. modify model architecture
    - may reduce bias and variance
1. add more training data
    - helps with variance problems, but usually have no effect on bias


## Error anlaysis on training set 
- algo must perform well on training before dev/test sets
- perform `error analysis` on training data
    - if you algo has high bias

## Techniques for reducing variance 
1. add more training data
    - most reliable way to address variance
1. add regularization
    - reduces variance, but may increase bias
1. add early stopping (i.e. stop gradient descent early)
    - reduces variances, but may increase bias
    - `regularization technique`
1. feature selection to decrease number/type of input features
    - might help with variance, but may increase bias
    - very useful if training set is small only
    - usage shifting away since data is plentiful
1. decrease the model size
    - may decrease variance, but may increasing bias
    - if speeding up model training is useful
        - decrease model size
    - if computational cost is not concern
        - add regularization
1. modify input features based on insights from error analysis
    - could increase variance so use regularization
1. modify model architecture
    - may reduce bias and variance

## Learning Curves #
## Diagnosing bias and vairance: Learning Curves 
1. Learning curve
1. Training error
    - can estimate the impact of adding more data

*`Note:`* **As training set size increases, dev set error should decrease**

*`Note:`* **Training set error usually increase as the training set size grows**

*`Note:`* **Small training sets means that the dev and training errors may randomly fluctuate**

## Plotting learning curves 
- may be computationally expensive
    - use small datasets
- if noise in training curves makes it hard to see trend
    1. use `sampling replacement` from the original set
        - randomly pick 10 different examples out of 100 to form 1st training set
        - randomly pick 10 different examples out of 100 to form 2nd training set
            - including the 1st sample set in the population
- if training set is skewed towards one class, choose 'balanced' subset 

## Comparing Human-Level Performance #
## Why we compare to human-level performance 
1. ease of obtaining data from human labelers
1. error analysis can draw on human intuition
1. use human-level performance to estimate the optimal error rate and also set a desired error rate

## Training and testing on different distributions #
## When to train and test on different distributions 
- re-weighing data
    - is only needed when u suspect additional data has a very different distribution than the dev/test set.
    - the additional data is much larger than the data that came from the same distribution as the dev/test set

## Generalizing from the training set to dev set 
- `data mismatch`: training set data is poor match for the dev/test set data
    - fails to generalizability of data
    - have two subsets
        - first: actual training sets
        - second: `training dev` sets that data will not train on

## Debugging inference algorithms #