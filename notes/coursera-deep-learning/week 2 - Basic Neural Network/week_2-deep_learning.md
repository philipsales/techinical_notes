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
(deep_learning)=

# Deep Learning #

## Week 1 - What is Neural Network
- ReLu: Rectified Linear Unit

### Supervised Learning
|  Input (x)  | Output (y) | Application | Types |
| --- | --- | --- | --- |
| Home features | Price | Real Estate | Standard NN | 
| Ads | Click on ad | Online Advertising | Standard NN |
| Image | Ojbect (1,..,1000) | Photo Tagging | CNN |
| Audio | Text Transcript | Speech Recognition | RNN |
| English | Chinese | Machine Translation | RNN |
| Image | Position of Cars | Autonomous Driving | Hybrid |


## Week 2 - Basics of Neural Network

### Binary Classification 
#### Logistic Regression
1. Logistic Regression Model
    - Notation
        - Given x 
        \begin{align*}
             (x^{(1)}, y^{(1)}),...,(x^{(m)}, y^{(m)})  
        \end{align*}
            - where x is feature and  
            \begin{align*}
            x ∈ ℝ^{n_x}  
            \end{align*}
            - where `m` is number of samples 
        - Want
        \begin{align*}
        \hat{y} = p(y=1|x)
        \end{align*}
        - Parameter 
        \begin{align*}
        x ∈ ℝ^{n_x}  , b ∈ ℝ 
        \end{align*}
        - Output 
        \begin{align*}
        z^{(i)} = \sigma (w^T x^{(i)} + b)
        \end{align*}
            - where 
                - sigmoid function
                \begin{align*}
                \sigma (z^{(i)}) = \frac{1}{1+e^{-z}}
                \end{align*}
                - `b` is y-intercept (real number)
                - `w` is independent variable (vector)
                - `n` is feature (vector)
                
1. Logistic Regression Cost Function 
    - `Loss Function`
        - computes error for single training example
        - Formula:
        \begin{align*}
        L(\hat{y}, y) = - (y log \hat{y} + (1-y) log (1-\hat{y}) )
        \end{align*}
        - if y = 1:
        \begin{align*}
        L(\hat{y}, y) = - log \hat{y}
        \end{align*}
            - want log𝑦̂ to be as big as possible, want 𝑦̂ large to be close to 1
        - if y = 0:
        \begin{align*}
        L(\hat{y}, y) = log (1-\hat{y}) )
        \end{align*}
            - want log1-𝑦̂ to be as big as possible, want 𝑦̂ small to be close to 0
        
    - `Cost Function`
        - average of the loss function of the entire training set
        - Formula:
        \begin{align*}
        J (w,b) = \frac{1}{m} \sum_{i=1}^m  L(\hat{y}^{(i)}, y^{(i)}) 
        \end{align*}
            - since `Loss Function` formula is
            \begin{align*}
            L(\hat{y}, y) = - (y log \hat{y} + (1-y) log (1-\hat{y}) )
            \end{align*}
            - Derived Formula:
            \begin{align*}
            J(w,b) = - \frac{1}{m} \sum_{i=1}^m (y log \hat{y} + (1-y) log (1-\hat{y}) )
            \end{align*}
            
1. Gradient Descent for Logistic Regression
- optimization algorithms like Gradient Descent are used to train your model and to minimize the cost.
    - #### Derivative
        - is just the slope of the function at a point 
        - the slope of a curve line varies relative to the point or location 
    - #### Convention
        - Partial Derivative
            - denoted by `fancy lowercase d`
            - if J is a function only contains 2 or more variables
        - Derivative
            - denoted by `lowercase d`
            - if J is a function only 1 variables
            
            
#### Loss Function Intuition
- Standard Representation
    - If y = 1:
        \begin{align*}
        p(y|x) = \hat{y}
        \end{align*}
        read as `the probability of y given x`

    - If y = 0:
        \begin{align*}
        p(y|x) = 1 - \hat{y}
        \end{align*}
        
- Compress Representation
    - Formula:
        \begin{align*}
        p(y|x) = \hat{y}^y (1-\hat{y})^{(1-y)}
        \end{align*}
    
    - Proof
    ```
    If y = 1:
    
    ```
    \begin{align*}
    p(y|x) & = \hat{y}^1 (1-\hat{y})^{(1-1)}  \\
    p(y|x) & = \hat{y} (1-\hat{y})^0  \\
    p(y|x) & = \hat{y} 1 \\
    p(y|x) & = \hat{y} 
    \end{align*}
    ```
    If y = 0:
    
    ```
    \begin{align*}
    p(y|x) & = \hat{y}^0 (1-\hat{y})^{(1-0)}  \\
    p(y|x) & = 1 (1-\hat{y})^1  \\
    p(y|x) & = 1-\hat{y} \\
    \end{align*}
    
    ```
    Since Logistic is a log function
    
    ```
    \begin{align*}
    log​p(y|x) & = log ​ \hat{y}^0 (1-\hat{y})^{(1-0)}  \\
    log​p(y|x) & = - y ​ log ​ \hat{y}^0 (1-\hat{y}) ​ log ​ (1-\hat{y})  \\
    L(\hat{y}, y) & = - y ​ log ​ \hat{y}^0 (1-\hat{y}) ​ log ​ (1-\hat{y})  \\
    \end{align*}
    - `negative` sign, since we want to make probabilities large, and in logistic regression we're expressing this. we want to minimize the loss function. So `minimizing the loss corresponds to maximizing the log of probability`
        

    
            
#### Cost Function Intuition
- Standard Representation
    \begin{align*}
    p(labels​in​training​set) = \prod_{i=1}^m p(y^{(i)} | x^{(i)})
    \end{align*}
    read as `the probability of all labels in training set`
    
    Since Logistic is a log function
    \begin{align}
    log​p(labels​in​training​set) & = \sum_{i=1}^m log ​p(y^{(i)} | x^{(i)}) \\
    log​p(labels​in​training​set) & = \sum_{i=1}^m L(\hat{y}, h)  \\
    log​p(labels​in​training​set) & = \sum_{i=1}^m - y ​ log ​ \hat{y}^0 (1-\hat{y}) ​ log ​ (1-\hat{y})  \\
    log​p(labels​in​training​set) & = - \frac{1}{m} \sum_{i=1}^m y ​ log ​ \hat{y}^0 (1-\hat{y}) ​ log ​ (1-\hat{y})  \\
    \end{align}
- Notes
    - log of a product is just summation of log
    - so basically a summation of Loss Function 
    - principle of `maximimum likelihood estimation` choose the parameters that maximizes the cost function
    - 1/m is added for scaling factor 
    
        


#### Derivative with Computation Graph
- organizes computation of left-to-right pass (i.e. backward propagation)
- follows the `chain rule`
- Algorithm 
    - Flow
        ![image info](../images/computation-graph-logistic-regression.png)
    - Given 
        \begin{align*}
        x_1, w_1, x_2, w_2, b
        \end{align*}
    - Steps
        1. forward propagation 
            1. compute for z 
                \begin{align*}
                z = w_1 x_1 + w_2 x_2 + b
                \end{align*}

            1. tranform to sigmoid function
                \begin{align*}
                a = \hat{y} = \sigma(z) \\
                \end{align*}
                where `a` is predicted value

            1. compute for Loss function
                \begin{align*}
                L(\hat{y},y)  = L(a,y)
                \end{align*}
                where `y` is actual value

        1. back propagation 
            1. compute for derivative of loss of `da`
            \begin{align*}
            da = \frac{dL(a,y)}{da} = - \frac{y}{a} + \frac{1-y}{1-a}
            \end{align*}
            read as `derivative of function L(a,y) given a is adjusted`

            1. compute for derivative of loss of `dz`
            \begin{align*}
            dz = \frac{dL(a,y)}{dz} = \frac{dL}{da} \frac{da}{dz} = a-y
            \end{align*}
            applying `chain rule` for carrying over the value of the derivates from Loss function (i.e. output) back to paremeters (i.e. input)

            1. compute how much to change `w` and `b`
            \begin{align*}
            dw_1 & = \frac{dL}{dw_1} = x_1 dz \\
            dw_2 & = \frac{dL}{dw_1} = x_2 dz \\
            db & = dz
            \end{align*}
            
        1. compute for gradient descent for `loss function` or 1 training example 
            \begin{align*}
            w_1 & := w_1 - \alpha dw_1 \\
            w_2 & := w_1 - \alpha dw_2 \\
            b & := b - \alpha db 
            \end{align*}

    
### Vectorization
- the art of getting rid of for loops
- tranposing for loops intro matrices
- making code optimize

    1. #### Non-vectorized Logistic Regression Derivatives
    
    ```
    J = 0, dw1 = 0, dw2 = 0, db = 0, m = 10
            for i = 1 to m:
    ```
    \begin{align*}
    z^{(i)} & = w^Tx^{(i)} = b \\
    a^{(i)} & = \sigma (z^{(i)}) \\
    J & += - [ y^{(i)} log \hat{y}^{i} + (1-y^{(i)}) log (1-\hat{y}^{(i)})] \\
    dz^{(i)} & = a^{(i)}  - y^{(i)} \\
    dw_1 & += x_1^{(i)} dz^{(i)} \\
    dw_2 & += x_2^{(i)} dz^{(i)} \\
    db & += dz^{(i)} \\
    J & = J/m, dw_1 = dw_1/m, dw_2 = dw_2/m, db = db/m
    \end{align*}
    
    1. #### Vectorized Logistic Regression 
    - Steps
        1. forward propagation
    
            1. compute for z 
            - normal notation
            \begin{align*}
            Z = w^T X + b
            \end{align*}
            
            - `numpy` notation
            \begin{align*}
            Z = np.dot(w.T, X) + b
            \end{align*}
            
            output is
            \begin{align*}
            Z = [ z^{(1)}, z^{(2)},..., z^{(m)}] 
            \end{align*}
            
            where 
                - matrix `X` is training inputs stack together 
                \begin{align*}
                X = (n_x , m)
                \end{align*}
                \begin{matrix}
                X  = \begin{bmatrix} 
                    . & . & . & . \\
                    x^{(1)} & x^{(2)} & . & x^{(m)} \\
                    . & . & . & .\\
                    \end{bmatrix}
                \end{matrix}
                - `w tranpose` is a row vector 
                - `n` is number of features/indepedent variable
                - `m` is number of samples
            
                - note: `b` which is a real number will automatically converted into a `vector` [ b b ... b ] because of `broadcasting` mechanism of numpy
        
            1. activate to sigmoid function
            \begin{align*}
            z & = w^T X + b \\
            \sigma(z) & = \frac{1}{1+e^{-z}} \\
            \sigma(w^T X + b) & = \frac{1}{1+e^{-(w^T x + b)}} \\
            A & = \sigma(z) 
            \end{align*}
            
            output is
            \begin{align*}
            A = [ a^{(1)}, a^{(2)},..., a^{(m)}] 
            \end{align*}
        
        1. back propagation
        
            1. compute for derivative of loss function `dz`
            
            since 
            \begin{align*}
            dz^{(1)} = a^{(1)} - y^{(1)}, dz^{(2)} = a^{(2)} - y^{(2)}, ....
            \end{align*}
            
            and 
            
            \begin{align*}
            A = [ a^{(1)},..., a^{(m)}]
            \end{align*}
            \begin{align*}
            Y = [ y^{(1)},..., y^{(m)}]
            \end{align*}
            
            thus
            \begin{align*}
            A - Y  = [  a^{(1)} - y^{(1)},   a^{(2)} - y^{(2)},...,a^{(m)} - y^{(m)} ] 
            \end{align*}
            
            therefore, vectorized form is
            \begin{align*}
            dZ = A - Y  
            \end{align*}
            
            1. compute how much to change `w` and `b`
        
            \begin{align*}
            dw & = \frac{1}{m} X dZ^T  & = \frac{1}{m} X (A-Y)^T \\
            db & = \frac{1}{m} \sum_{i=1}^m (dZ)  & = \frac{1}{m} \sum_{i=1}^m (A-Y)  
            \end{align*}
        
        1. compute for Gradient Descent for loss function or 1 training example
        
            \begin{align*}
            w & := w - \alpha dw \\
            b & := b - \alpha db
            \end{align*}
            
    1. #### Vectorized Logistic Regression - Putting It Altogether
    
        for iter in range(1000):
    
        \begin{align*}
        Z & = w^TX + b \\
        A & = \sigma(Z) \\
        dZ & = A - Y \\
        dw & = \frac{1}{m} X dZ^T \\
        db & = \frac{1}{m} np.sum(dZ)  \\
        w & := w - \alpha dw \\
        b & := b - \alpha db 
        \end{align*}
        
### Broadcasting 
- optimization option aside from vectorization
- matrix computation without explicit for loop
- iteration function/operator without explicit for-loop
- e.g. multiplying 3x4 matrix over 1x4 vector will outout 3x4
     
