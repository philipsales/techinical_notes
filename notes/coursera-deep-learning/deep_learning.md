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
- use to train or learn the parameters
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
        ![image info](./images/computation-graph-logistic-regression.png)
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
                a = \sigma(z)
                \end{align*}

            1. compute for Loss function
                \begin{align*}
                L(a,y)
                \end{align*}

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
            A = \sigma(z)
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
            dw & = \frac{1}{m} X dZ^T \\
            db & = \frac{1}{m} np.sum(dZ)  
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
     
## Week 3 - Shallow Neural Network

### Neural Network Representation
- Hidden Layer
    - true values are not observed as compared to input layer and output layer

- Representation - 2 Layer Neural Network
    
    ![image info](./images/shallow-neural-network.png)
    
    - `note`: input layer is not counted
        
- Notation
    - Input Layer
        \begin{align*}
        a^{[o]} = x 
        \end{align*}
        means `activations`
    - Hidden Layer 
        \begin{matrix}
        a^{[1]}  = \begin{bmatrix} 
            a^{[1]}_1 \\
            a^{[1]}_2 \\
            a^{[1]}_3 \\
            \end{bmatrix}
        \end{matrix}
    - Output Layer 
        \begin{align}
        a^{[2]} = \hat{y}
        \end{align}
        
### Computing Neural Network Output 

- Single neuron computation

    ![image info](./images/compute-neuron.png)
    
    
    
- 1st Layer - 1st Node computation

    ![image info](./images/compute-1st_node-1st_layer.png)
    
    - Formula:
        \begin{align}
        z_1^{[1]} & = w_1^{[1]T} x + b_1^{[1]} \\
        a_1^{[1]} & = \sigma( z_1^{[1]})
        \end{align}
    
- 1st Layer - 2nd Node computation

    ![image info](./images/compute-2nd_node-1st_layer.png)
    
    - Formula:
        \begin{align}
        z_2^{[1]} & = w_2^{[1]T} x + b_2^{[1]} \\
        a_2^{[1]} & = \sigma( z_2^{[1]})
        \end{align}
        
- 1st Layer - All Nodes computation

    ![image info](./images/compute-all_node-1st_layer.png)
    
    - Unvectorized Formula:
        \begin{align}
        z_1^{[1]} & = w_1^{[1]T} x + b_1^{[1]} , a_1^{[1]} = \sigma( z_1^{[1]}) \\
        z_2^{[1]} & = w_2^{[1]T} x + b_2^{[1]} , a_2^{[1]} = \sigma( z_2^{[1]}) \\
        z_3^{[1]} & = w_3^{[1]T} x + b_3^{[1]} , a_3^{[1]} = \sigma( z_3^{[1]}) \\
        z_4^{[1]} & = w_4^{[1]T} x + b_4^{[1]} , a_4^{[1]} = \sigma( z_4^{[1]}) 
        \end{align}
        
    - Vectorized Formula:
        - Given
            \begin{matrix}
            W^{[1]} & = & \begin{bmatrix} 
                - & w^{[1]T}_1 & - \\
                - & w^{[1]T}_2 & - \\
                - & w^{[1]T}_3 & - \\
                - & w^{[1]T}_4 & - \\
                \end{bmatrix} \\
            a^{[0]} = & x  = & \begin{bmatrix} 
                 x_1 \\
                 x_2 \\
                 x_3 \\
                 x_4 \\
                \end{bmatrix} \\
            b^{[1]} & = & \begin{bmatrix} 
                 b_1^{[1]} \\
                 b_2^{[1]} \\
                 b_3^{[1]} \\
                 b_4^{[1]} \\
                \end{bmatrix}
            \end{matrix}
        - Compute for `z` 
            \begin{matrix}
            z^{[1]} = \begin{bmatrix} 
                - & w^{[1]T}_1 & - \\
                - & w^{[1]T}_2 & - \\
                - & w^{[1]T}_3 & - \\
                - & w^{[1]T}_4 & - \\
                \end{bmatrix} 
                \begin{bmatrix} 
                 x_1 \\
                 x_2 \\
                 x_3 \\
                \end{bmatrix} 
                + 
                \begin{bmatrix} 
                 b_1^{[1]} \\
                 b_2^{[1]} \\
                 b_3^{[1]} \\
                 b_4^{[1]} \\
                \end{bmatrix}
            \end{matrix}
            
            \begin{matrix}
            z^{[1]} = 
                \begin{bmatrix} 
                 z_1^{[1]} \\
                 z_2^{[1]} \\
                 z_3^{[1]} \\
                 z_4^{[1]} \\
                \end{bmatrix} =
                \begin{bmatrix} 
                 w_1^{[1]T} x + b_1^{[1]}  \\
                 w_2^{[1]T} x + b_2^{[1]}  \\
                 w_3^{[1]T} x + b_3^{[1]}  \\
                 w_4^{[1]T} x + b_4^{[1]}  \\
                \end{bmatrix} 
            \end{matrix}
        - Given
            \begin{align}
            a^{[1]} & = \begin{bmatrix} 
                 a_1^{[1]} \\
                 a_2^{[1]} \\
                 a_3^{[1]} \\
                 a_4^{[1]} \\
                \end{bmatrix}
            \end{align}
        
        - Compute for `a`
            \begin{align}
            a^{[1]} & = \sigma \left(
                \begin{bmatrix} 
                 z_1^{[1]} \\
                 z_2^{[1]} \\
                 z_3^{[1]} \\
                 z_4^{[1]} \\
                \end{bmatrix} 
            \right) \\
            a^{[1]} & = \sigma(Z^{[1]})
            \end{align}
            
        - Compress Vectorized Formula
            - Compute for Layer 1 (hidden layer)
                \begin{align}
                z^{[1]} & = W^{[1]} a^{[0]} + b^{[1]} \\
                a^{[1]} & = \sigma( z^{[1]})
                \end{align}
                
            - Compute for Layer 2 (output layer)
                \begin{align}
                z^{[2]} & = W^{[2]} a^{[1]} + b^{[2]} \\
                a^{[2]} & = \sigma( z^{[2]})
                \end{align}