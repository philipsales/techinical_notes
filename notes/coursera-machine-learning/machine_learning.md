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
(machine_learning)=

# Machine Learning #

## Week 1 - Introduction 

### Supervised Learning 
- already know what correct output should look like
- have the idea that there is relationship between input and output

Categrozied as:
1. Regression
    - predict relationship within `continuous` output
    - e.g. age vs income
1. Classification
    - predict relationship within `discrete` output
    - e.g. tumor (malignant or benign) vs tumor size

### Unsupervised Learning 
- little or no idea what results should look like
- derive structure from data where it is not known what the effect of the variables
- no feedback based on the prediction

Categrozied as:
1. Clustering
    - e.g. 1,000,000 different genes will be clustered to different or similar variables, such as lifespan, roles etc.
2. Non-Clustering
    - e.g. "cocktail party algorithmn"

## Week 1 - Linear Regression with one variable 
### Model Representation 
- also called `Univariate linear regression`
`Notation`:
- m = Number of trainig examples
- x's = "input" variable / `features`
- y's = "output" variable / `target`
- (x,y) = one training example
- (xⁱ, yⁱ) = index ⁱth training example
- h = hypothesis, maps from x's to y's
- h(x) = represents hypothesis

### Cost Function / Optimization Objective 
- a type of `Loss Function`
- also called `Squared error function`
- in statistics `Sum of squares of residuals`
    - `residuals` is the difference between the dependent variable value (actual) and the value given by the model (predicted)
- can measure accuracy of hypothesis
- measures `how wrong` the model is in terms of its ability to estimate the relationship between X and Y
- helps learner to correct or change behaviour to minimize mistakes
- is a `single number` value
- Hypothesis: `linear function`
    - formula
        - Machine Learning: hθ(x) = θ₀'s +  θ₁x
        - Statistic: y     = a + bX 
            - y = dependent variable
            - a = y-intercept 
            - b = slope
            - X = independent variable
        - θ₀'s is `y-intercept` (a)
        - θ₁ is `slope` (bX)
    - parameters: θᵢ's `thetas`
    - problem: how to choose θᵢ's 
    
#### Cost Function / Optimization Objective Intution I 
- Hypothesis Formula for single feature (Linear Regression): 

\begin{align*}
hθ(x) = θ₀ +  θ₁x
\end{align*}
- Parameters: 
\begin{align*}
θ₀,θ₁
\end{align*}
- Cost Function / Optimization Objective formula: 
\begin{align*}
J(θ₀,θ₁) = \frac{1}{2m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)²
\end{align*}

- Goal: 
\begin{align*}
minimize ​ J(θ₀,θ₁) 
\end{align*}

### Gradient Descent 
    - algo use to minimize the Cost Function / Optimization Objectives and other functions

- Gradient Descent Formula:
\begin{align*}
\theta_j:=\theta_j-\alpha \frac{∂}{∂\theta_j} J(\theta_0, \theta_1)​ 
\end{align*}
- Parameters:
\begin{align*}
j =0,1
\end{align*}
- Learning Rate:
\begin{align*}
\alpha   
\end{align*}
- Partial Derivatives:
\begin{align*}
\frac{∂}{∂\theta_1} J(\theta_0, \theta_1)
\end{align*}

- Derivatives:
\begin{align*}
\frac{d}{d\theta_1} J(\theta_0, \theta_1)
\end{align*}

### Gradient Descent: Intuition I 
\begin{align*}
\theta_1:=\theta_1-\alpha \frac{∂}{∂\theta_1} J(\theta_1)​ 
\end{align*}

#### Derivative 
- take a tangent of the point and look at the slope of the line
- what's the slope of the line that is just tangent to the function
- `Slope`
    - change in vertical direction (y-axis) over change in horizontal direction (x-axis)
- if `negative slope` or negative derivative = **decrease value of θ₁**
    - value in contour plot is going down
    - value of `θ₁` is moving to **right**
    
- if `positive slope` or positive derivative = **increase value of θ₁**
    - value in contour plot is going up 
    - value of `θ₁` is moving to **left**
    
#### Learning Rate 
- Formula:
    - step size = slope (θ₁) x learning rate (𝛼)
    - new interecept = original intercept (θ₀) - step size
- `note`: Gradient descent stops when step size is close to zero
- `note`: In practice, minimum slope is `0.009`
- `note`: In practice, minimum learning rate is `0.1`
- `note`: In practice, maximum step size is `1000` or greater
    
- is the step size use by Gradient Descent to identify the next intercept
- size of the step is related to the slope
- will automatically take smaller steps as approaches the local minimum
- if too small, will be to slow
- if too large, can overshoot the minimum and may not converge

### Gradient Descent For Linear Regression 
- Gradient susceptible to local optima but not in linear regression
    - `note`: Linear regression has no local optima, only global optima 
- Cost Function / Optimization Objective for linear regression is always to 
    - `Convex function` - also called `Bowl shaped function`
        - doesn't have local optima or any other optima
- usually paremeters is initialized in (0,0) for (θ₀,θ₁)

- Cost Function / Optimization Objective Formula: 
\begin{align*}
J(θ₀,θ₁) = \frac{1}{2m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)²
\end{align*}

- Gradient Descent Formula
\begin{align*}
\theta_j:=\theta_j-\alpha \frac{∂}{∂\theta_j} J(\theta_0, \theta_1)​ 
\end{align*}
    
- Thus, derive the formula: 
    - repeat until converge {
        \begin{align*}
        \theta_0:=\theta_0-\alpha \frac{1}{m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)
        \end{align*}
        \begin{align*}
        \theta_1:=\theta_1-\alpha \frac{1}{m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)x⁽ⁱ⁾
        \end{align*}
    } simultaneously update (θ₀,θ₁) 


## Week 1 - Linear Algebra Review 
- `Matrix` - number of rows x number of columns
    - naming convention: capitalize
- `Matrix Elements` - entries of matrix
    - Aᵢⱼ = ith row, jth column 
- `Vector` - a matrix with only 1 column
    - `arrays`
    - naming convention: small-caps 
    - e.g `4-dimensional vectors` is 4 just elements/rows in 1 column
    - yᵢ = ith row element
        - one-index (more common) 
        - zero-index (more convenient)
- `Scaler` - real number

### Matrix Addition 
- can only add of same dimensions

### Matrix Multiplication Properties 
1. Not commutative 
    - a²b ≠ ab²
    - ab ≠ ab
    - if A = I  
        - A * B = I * B = B
        - B * A = B * I = B
        - A * B = B * A
1. Associative
    - a * b = b * a
1. identity matrix
    - if A is the 3x3 matrix, then A * B = B * A
    - multipleing itself by 1

#### Matrix Inverse and Transpose 
1. Matrix Inverse
    - 3 (3⁻¹) is just 3 (1/3) = 1
    - A (A⁻¹) = A⁻¹A = I
    - not all numbers have an inverse (e.g. zero) non-invertible matrices
        - 0 (0⁻¹) = undefined
        - also called `singular` or `degenrate` matrix
1. Matrix Transpose
    - Bᵢⱼ = Aⱼᵢ
        
        | 1 2 0 |          
    A = | 3 5 9 |     
    
         | 1 3 |
    Aᵀ = | 2 5 |
         | 0 9 |
         
## Week 2 - Multivariate Regression 
### Notation
- n = number of features (columns/dependent variables)
- m = number of training examples (rows/observation)
- x⁽ⁱ⁾ = input (features) of iᵗʰ training example
    - superscript `i` is the index of the row of the table
    - usually vector
- xⱼ⁽ⁱ⁾ = value of feature j in the iᵗʰ training example
    - subscript `j` is the index of the vector from the index of i
- θ = parameters

### Single Feature Hypothesis Formula
- ℎθ(𝑥) = θ₀ + θ₁𝑥

### Multiple Variate Hypothesis Formula: 
- ℎθ(𝑥) = θ₀X₀ + θ₁x₁ + θ₂x₂ + .. 
    - For convenience of notation, define X₀ = 1
        - thus, `ℎθ(𝑥) = θ₀ + θ₁x₁ + θ₂x₂ + .. `
        - using Matrix transpose properties, compact version is
            -  `ℎθ(𝑥) = θᵀx`
    - zero-index vector

### Gradient Descent for Multivariate Hypothesis Formula: 
- Hypothesis Formula for Multiple feature (Multivariate Regression): 
\begin{align*}
ℎθ(𝑥) = θ₀X₀ + θ₁x₁ + θ₂x₂ + .. 
\end{align*}

- Parameters: 
\begin{align*}
θ 
\end{align*}

- Cost Function / Optimization Objective Formula: 
\begin{align*}
J(θ₀,θ₁) = \frac{1}{2m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)
\end{align*}
   

- Gradient Descent Formula
\begin{align*}
\theta_j:=\theta_j-\alpha \frac{∂}{∂\theta_j} J(\theta)​ 
\end{align*}
    
- Thus, derive the formula: 
    - repeat until converge {
        \begin{align*}
        \theta_0:=\theta_0-\alpha \frac{1}{m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)x₀⁽ⁱ⁾
        \end{align*}
        \begin{align*}
        \theta_1:=\theta_1-\alpha \frac{1}{m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)x₁⁽ⁱ⁾
        \end{align*}
        \begin{align*}
        ...
        ...
        \end{align*}
 
    } simultaneously update all θⱼ
    
### Gradient Descent - Feature Scaling 
- to make gradient descent converge quickly
- to prevent the θ to get stuck in local optima
- tall skinny contours can cause the descent to oscillate more
- features can be not exactly same range (e.g. -4 to 3)
- `Rule of thumb`: -3 to 3, -1 to 1
- Types of Scaling
    1. Feature scaling 
        - xᵢ (input) / sᵢ (range)
    1. Mean normalization
        - xᵢ (input) - μᵢ (average of all values for feature (i)) / sᵢ (min-max or range or standard deviation)
        
### Gradient Descent - Learning Rate
- if α is too small: slow convergence.
- if α is too large: may not decrease on every iteration and thus may not converge.

### Features and Polynomial Regression
- quadratic function
    - `θ₀ + θ₁x + θ₂x²`
- cubic function
    - `θ₀ + θ₁x + θ₂x² + θ₃x³`
    
## Week 2 - Computing Parameters Analytically
### Normal Equation
- `Gradient Descent Method`: uses iterative algorithm to compute for θ
    - Disadvantages 
        - Need to choose learning rate 𝛼
        - Needs many iterations
    - Advantages 
        - Works well in large number of features (i.e n = 1,000,000) 
- `Normal Equation Method`: compute analytically to solve for θ
    - Formula
        - `θ = (XᵀX)⁻¹Xᵀy`
    - Disadvantages 
        - Slow in large number of features (i.e. n > 10,000)
        - Need to compute `(XᵀX)⁻¹`
    - Advantages 
        - No need to choose learning rate
        - Don't need to iterate
        
### Normal Equation Noninvertibility
- `degenerate` or `singular`: XᵀX is non-invertible matrices
    - causes by the following:
        1. Redundant features
            - e.g. x₁ = size in feet, x₂ = size in meters
        1. Too many features (e.g. m < n)
            - e.g. m = number of samples, n = number of features
            - Solution: 
                1. delete some features
                1. use regularization
                
## Week 2 - Octave Tutorial
### Basic Operations
- `~=` not equals
- `PS1('>> ');` octave prompt
- `disp()` print
- `disp(sprintf('2 decimals: %0.2f', a))`
#### Vector 
- vector = [ 1; 2; 3 ]
- vector_iterate = 1:0.1:2
- vector_range = 1:6

#### Matrix
- matrix = [ 1 3; 5 3; 3 5 ]
- matrix = ones(2,3)
- matrix = 2*ones(3,3)
- rand = rand(3,3)
- randn = randn(3,3)
    - `Guassian distribution`
- eye(4)
    - `identity matrix`
    
#### Plotting 
- w = -6 + sqrt(10)*(randn(1,10000))
- hist(w)
- hist(w, 50)

### Moving Data
- size(matrix)
- size(matrix,1) 
    - number of rows
- size(matrix,2)
    - number of columns 
- length(vector)
- pwd
- load('featuresX.dat')
- whos
    - show variables
- clear featuresX
- clear
    - clean all saved variables
- save hello.txt v
    - save content of variable v to filename 'hello.txt'
- save hello.txt v -ascii
    - save human readable
### Finding Data
- [row, column] = find(A >= 7)
- A = [1 2; 3 5; 6 8]
- A(3,2)
    - find index of row and column
- A(2,:)
    - get all value in 2nd row
- A(:,2)
    - get all value in 2nd column 
- A(:)
    - convert matrix as as 1xn vector 
- A([1 3],:)
    - get all value in 1st and 3rd column 
- A(:,2) = [ 10; 11; 12]
    - assignment of vector to matrix on specific index
- A = [A, [100; 102; 103]]
    - append vector to matrix
- C = [ A B ]
    - concatenate matrices on left
- C = [ A; B ]
    - concatenate matrices on bottom 
    
### Computing on Data
- `.`
    - elemeant-wise
- `.*`
    - element-wise multiplication
- `.^2`
    - element-wise square 
- `./`
    - element-wise division 
- v + ones(length(v), 1)
    - increment vector by 1
- v + 1
    - increment vector by 1
- `'`
    - transpose
- `pinv(matrix)`
    - inverse
- `magic(3)`
    - soduko properties
- max(rand(3), rand(3)), max(vector), min(vector), abs(vector), log(vector), floor(v), ceil(v)
- max(max(A))
    - get max values per column 
- max(A(:))
    - get max value
- max(A, [], 1) 
    - row-wise maximum
- max(A, [], 2) 
    - column-wise maximum
    - default for max is column-wise
    
### Plotting Data
- `hold on`
    - overwrite existing plot
- `help plot`
- plotting sample
    ```
    >> y1 = sin(2*pi*4*t);
    >> plot(t,y1)
    >> hold on;
    >> y2 = cos(2*pi*4*t);
    >> plot(t, y2,'r')
    >> ylabel('value')
    >> xlabel('time')
    >> legend('sin','cos')
    >> print -dpng 'myplot.png'
    >> close
    ```
- plotting separate multiple figure 
    ```
    >> figure(1); plot(t,y1);
    >> figure(2); plot(t,y2);
    ```
- multiple plotting in 1 figure 
    - subplot(1,2,1);
        - divides plot in 1x2 grid, access 1st element
    - subplot(1,2,2);
        - divides plot in 1x2 grid, access 2nd element
    - clf
        - clear figure
    ```
    >> subplot(1,2,1);
    >> plot(t,y1)
    >> subplot(1,2,2);
    >> plot(t,y2)
    ```
- coloring scale plot
    - A = magic(5)
    - imagesc(A), colorbar, colormap gray;
        - `comma chaining commands`
        
### Control Statements 
- for loop
    ```
    for i=1:10,
      v(i) = 2^i;
    end;
    ```
- while loop
    ```
    i = 1;
    while i <= 5,
        v(i) = 100;
        i = i+1;
        if i == 6,
           break;
        end;
    end;
    ```
- else if 
    ```
    if v(1) == 1,
       disp('value is 1');
    elseif v(1) == 2,
       disp('value is 2');
    else
       disp('value is not 1 or 2');
    end;
    ```
    
- `addpath('C:\Users')`
    - use as root path in search path
    
### Vectorization 
- using libraries to run the script faster
- using more efficient code

## Week 2 - Classification and Representation
### Classification
- practical applications
    - spam identification
    - fraud detection
    - malignant/benign
- arbitrary assignment of value 0,1 
    - `y ∈ {0,1}` 
        - binary class classification  
        - normally `negative class` means absence (e.g benign tumor)
        - normally `positive class` means existence (e.g malignant tumor)
    - `y ∈ {0,1,2}` 
        - multi class classification 
- Formula:
    - Logistic Regression/ Logistic Classification
- Threshold classifier output ℎθ(𝑥) at `0.5`
    - if ℎθ(𝑥) >= 0.5, predict "y = 1" 
    - if ℎθ(𝑥) < 0.5, predict "y = 0" 
- `Regression` is just historical naming, instead of Classification
- Formula:
    \begin{align*}
    0 ≤ ℎθ(𝑥) ≤ 1
    \end{align*}
    
- Expected Result
    - ℎθ(𝑥) > 1 or 0

### Hypothesis Representation
- Linear Regression Hypothesis
    \begin{align*}
    ℎθ(𝑥) = θᵀx
    \end{align*}
- Logistic Regression Hypothesis
    \begin{align*}
    ℎθ(𝑥) = g(θᵀx)
    \end{align*}
    where `function g(z)` or `sigmoid function/logistic function` is:
    \begin{align*}
    g(z) =  \frac{1}{1+e⁻ᶻ}
    \end{align*}
    
- Sigmoid Function
    - sigmoid is used to squish any value into probability into zero to one 
    
    
#### Interpretation of Hypothesis Output
- ℎθ(𝑥) = estimated probability that y = 1 on input x 
    - e.g. ℎθ(𝑥) = 0.7
        - means 70% chance of tumor being malignant 
        - means 30% chance of tumor being benign 
        - mathmatical equivalent
            -  `ℎθ(𝑥) = p(y = 1|x; θ)`
            - "probability that y = 1, given x, paremeterized by theta"
            -  `ℎθ(𝑥) = p(y = 0|x; θ)`
            - "probability that y = 0, given x, paremeterized by theta"
- `Suppose predict "y = 1" if ℎθ(𝑥) ≥ 0.5`
    - if θᵀx ≥ 0
- `Suppose predict "y = 0" if ℎθ(𝑥) < 0.5`
    - if θᵀx < 0
         
- odds is the ratio of probability of happening / probability of not happening
\begin{align*}
odds = \frac{p}{1-p} 
\end{align*}

- `log(odds)` just makes things symmetrical and easier to interpret
        

### Decision Boundary 
- decision boundary is property of the hypothesis and parameters not of the training sets
- Types of decision boundaries
    1. Linear
    1. Non-linear
    1. Complex non-linear for Higher order polynomial orders
    
- ℎθ(𝑥) = g(θᵀ𝑥) 
    - convert: ℎθ(𝑥) = g(θ + θ₁x₁ + θ₂x₂)
    - supposed: θ₀ = -3,  θ₁ = 1,  θ₂ = 1
    - predict "y=1" if -3 + x₁ + x₂ ≥ 0
        - x₁ + x₂ ≥ 3
        
        5 - x > 0
        - -x₁ = 5


## Week 2 - Logistic Regression 
### Cost Function / Optimization Objective
- Logistic Cost Function / Optimization Objective
\begin{align*}
J(\theta) = \frac{1}{m} \sum_{i=1}^m Cost(h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)
\end{align*}

\begin{align*}
Cost(ℎθ(𝑥),y) = -log(ℎθ(𝑥))​​if​y=1
\end{align*}

\begin{align*}
Cost(ℎθ(𝑥),y) = -log(1-ℎθ(𝑥))​​if​y=0
\end{align*}

- Logistic Cost Function / Optimization Objective conditions
    - `Cost(hθ(x),y)=0 if hθ(x) = y`
    - `Cost(hθ(x),y)→∞ if y=0 and hθ(x)→1`
    - `Cost(hθ(x),y)→∞ if y=1 and hθ(x)→0`
    
- Simplified Logistic Regression Cost Function / Optimization Objective 

    Original formula:
    \begin{align*}
    J(\theta) = \frac{1}{m} \sum_{i=1}^m Cost(h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)
    \end{align*}
    
    Converted Cost Function / Optimization Objective
    \begin{align*}
    Cost(hθ(x),y) = -y*log(hθ(x)) - (1-y)log(1-hθ(x))
    \end{align*}

    Conditional Cost Function / Optimization Objective
    \begin{align*}
    if​​y=1: Cost(hθ(x),y) = -log(hθ(x))
    \end{align*}

    \begin{align*}
    if​​y=0: Cost(hθ(x),y) = log(1-hθ(x))
    \end{align*}
    
    Thus, Compress Conditional Formula:
    \begin{align*}
    J(\theta) = - \frac{1}{m}[\sum_{i=1}^m  y⁽ⁱ⁾logh₀(x⁽ⁱ⁾) + (1-y⁽ⁱ⁾)log(1-h₀(x⁽ⁱ⁾)) ]
    \end{align*}
    
    Vectorized Formula:
    \begin{align*}
    h=g(Xθ)
    \end{align*}
    
    \begin{align*}
    J(\theta) = - \frac{1}{m} * (-yᵀ​​log(h) - (1-y)ᵀ​​log(1-h))
    \end{align*}

- General Form of Gradient Descent Formula:
    \begin{align*}
    \theta_j:=\theta_j-\alpha \frac{∂}{∂\theta_j} J(\theta_0)​ 
    \end{align*}

- Gradient Descent for Logistic Regression Formula:
    - repeat until converge {
    \begin{align*}
    \theta_j := \theta_j - \alpha \sum_{i=1}^m (h₀(x⁽ⁱ⁾)-y⁽ⁱ⁾) ​​ xⱼ⁽ⁱ⁾
    \end{align*}
    } simulatenously update all θⱼ

- Vectorized Gradient Descent for Logistic Regression Formula:
    - repeat until converge {
    \begin{align*}
    \theta := \theta - \frac{\alpha}{m} Xᵀ(g(X\theta)- y)
    \end{align*}
    } simulatenously update all θⱼ

###  Advanced Optimization
- Pros:
    - No need to manually pick learning rate
    - Often faster than Gradient Descent
- Cons:
    - More complex

- Types of Optimization algorithmns
    1. Gradient descent
    1. Conjugate gradient
    1. BFGS
    1. L-BFGS
  
### Multiclass classification 
- y ∈ {0,1, ...n}
    - arbitrary assignment of value 0,1, ..
- `One-vs-all (one-vs-rest)` classification algorithmn
    - combining different classes

    
## Week 2 - Regularization 
### Types of Data Fitting
1. Underfitting
    - "high bias"
        - term `bias` is historical
        - inabilty of machine learning method (e.g linear regression) to capture the true relationship
        - very strong preconception/bias to fit a straight line (i.e. linear regression) ()i.e. linear regression
1. Overfitting 
    - "high variance"
        - term `variance` is historical
    - it can fit almost any function and this face of possible hypothesis is just too large, it's too variable.  
    - fails to generalize to new examples
    - inconsistent and variable in prediction because the line fits changes variable for every dataset
    - difference in fits between training and test sets 
    
### Problem of Overfitting
- Causes
    1. Too many features and too little training data
- Solutions: 
    1. Reduce features
        - Manually select which features to keep
        - Model selection algorithm
            - algorithm that decides which features to keep and throw
    1. Regularization
    
    
### Regularization - Intuition
#### Idea behind regularization
- penalize and make  θ₃, θ₄ really small 
    - make small values for parameters 
        - "simpler" hypothesis
            - if cubic or higher function polynomial like θ₃, θ₄ are closer to zero
                - essentially will just be quadratic function
        - Less prone to `overfitting`
- `note:` θ₀ is not included in penalizing
- `note:` if lambda is set extremely large
    - may lead to `underfitting` because value is close to zero making it cancel out the parameters
    - e.g 
    
\begin{align*}
min(θ) = \frac{1}{2m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)² + 1,000,000  ​​ 𝜃₃² + 1,000,000  ​​ 𝜃₄²
\end{align*}
### Regularization - Cost Function / Optimization Objective 
- Regularized Cost Function / Optimization Objective Formula: 

\begin{align*}
J(θ) = \frac{1}{2m} [\sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)² + \lambda \sum_{j=1}^n \theta_j^2]
\end{align*}

### Regularization - Linear Regression


#### Regularization - Gradient Descent

- Regularized Gradient Descent for Linear Regression Formula:
    - repeat until converge {
    \begin{align*}
    \theta_0 := \theta_0 - \alpha \sum_{i=1}^m (h₀(x⁽ⁱ⁾)-y⁽ⁱ⁾) ​​ x₀⁽ⁱ⁾
    \end{align*}
    \begin{align*}
    \theta_0 := \theta_j - \alpha [\frac{1}{m} [\sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)x𝑗⁽ⁱ⁾ + \frac{\lambda}{m} \theta_j]
    \end{align*}
    
    Update Rule
    \begin{align*}
    \theta_0 := \theta_j(1 - \alpha\frac{\lambda}{m}) - \alpha \frac{1}{m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)x𝑗⁽ⁱ⁾ 
    \end{align*}
    \begin{align*}
    ( j = 1,2,3,...,n)
    \end{align*}
    } simulatenously update all θⱼ



#### Regularization - Normal Equation
- Regularized Normal Equation for Logistic Regression Formula:

    \begin{align*}
    θ = (XᵀX + 𝜆 L )⁻¹Xᵀy
    \end{align*}
    
### Regularization - Logistic Regression


#### Regularization - Gradient Descent
- Regularized Gradient Descent for Logistic Regression Formula:
    - repeat until converge {
    \begin{align*}
    \theta_0 := \theta_0 - \alpha \sum_{i=1}^m (h₀(x⁽ⁱ⁾)-y⁽ⁱ⁾) ​​ x₀⁽ⁱ⁾
    \end{align*}
    
    \begin{align*}
    \theta_0 := \theta_j - \alpha [\frac{1}{m} [\sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)x𝑗⁽ⁱ⁾ + \frac{\lambda}{m} \theta_j]
    \end{align*}
    
    
#### Regularization - Cost Function / Optimization Objective
- Regularized Cost Function / Optimization Objective for Logistic Regression:

    \begin{align*}
    J(\theta) = - \frac{1}{m}[\sum_{i=1}^m  y⁽ⁱ⁾logh₀(x⁽ⁱ⁾) + (1-y⁽ⁱ⁾)log(1-h₀(x⁽ⁱ⁾)) ] ​ + \frac{\lambda}{2m} \sum_{j=1}^n \theta_j^2
    \end{align*}
    
## Week 4 - Neural Networks
- use for `complex non-linear hypothesis`

### Neural Networks Terminology
- a single model of a neuron 
    - `is just a logistic unit`
- x₀ is `bias unit`
    - always equal to `1`
- `sigmoid (logistic) activation function`
    - non-linearity g(z)
- `θ`(theta parameters)
    - `weights`
    - `coefficient`
- 1st Layer
    - `input layer`
- 2nd or more that is not final Layer
    - `hidden layer`
    - values that cannot be observed in training set
- final Layer
    - `output layer`
- "activation" of unit `i` in layer `j` 
    \begin{align*}
    a_i^j
    \end{align*}
    
- matrix of controlling funciton mapping from layer j to layer j+1
    \begin{align*}
    \Theta^j
    \end{align*}
    
- If network has sⱼ units in layer j and sⱼ+1 units in layer ⱼ+1, then Θ(ⱼ) will be of dimension sⱼ+1 × (sⱼ+1)
    - The +1 comes from the addition in Θ𝑗 of the "bias nodes"
    - the output nodes will not include the bias nodes while the inputs will

### Model Representation
- Forward Progation

\begin{align*}
a_1^{(2)} = g( \Theta_{10}^{(1)} x_0  + \Theta_{11}^{(1)} x_1  + \Theta_{12}^{(1)} x_2 + \Theta_{13}^{(1)} x_3)
\end{align*}

\begin{align*}
a_2^{(2)} = g( \Theta_{20}^{(1)} x_0  + \Theta_{21}^{(1)} x_1  + \Theta_{22}^{(1)} x_2 + \Theta_{23}^{(1)} x_3)
\end{align*}

\begin{align*}
a_3^{(2)} = g( \Theta_{30}^{(1)} x_0  + \Theta_{31}^{(1)} x_1  + \Theta_{32}^{(1)} x_2 + \Theta_{33}^{(1)} x_3)
\end{align*}

\begin{align*}
h_{\Theta}(x) = g( \Theta_{10}^{(2)} a_0^{(2)} +  \Theta_{11}^{(2)} a_1^{(2)} + \Theta_{12}^{(2)} a_2^{(2)} +  \Theta_{13}^{(2)} a_3^{(2)})
\end{align*}

- Vectorized Forward Progation
    - Create a new variable for 2nd layer
        \begin{align*}
        g(z_k^{(2)}) = \Theta_{k,0}^{1}x_0 + \Theta_{k,1}^{1}x_1 + \Theta_{k,n}^{1}x_n 
        \end{align*}
    - Substitute the new variable
        \begin{align*}
        a_1^{(2)} = g(z_1^{(2)})
        \end{align*}
        \begin{align*}
        a_2^{(2)} = g(z_2^{(2)})
        \end{align*}
        \begin{align*}
        a_3^{(2)} = g(z_3^{(2)})
        \end{align*}
    - Final formula
        \begin{align*}
        h_{\Theta} = a^{(j+1)} = g(z^{(j+1)})
        \end{align*}
        
## Week 5 - Neural Network (Classification)
- fitting the parameters in the network
- number of units/neuron (not counting bias unit) in layer l 
\begin{align*}
s_l
\end{align*}
- number of output units/classes 
\begin{align*}
K
\end{align*}
- total number of layers in network
\begin{align*}
L
\end{align*}

#### Regularization - Cost Function / Optimization Objective
- Regularized Cost Function / Optimization Objective for Neural Network:

\begin{align*}
J(\Theta) = - \frac{1}{m} [\sum_{i=1}^m \sum_{k=1}^K y_k^{(i)} log(h_\Theta(x^{(i)}))_k + (1-y_k^{(i)})log(1-h_\Theta(x^{(i)}))_k) ] ​ + \frac{\lambda}{2m} \sum_{l=1}^{L-1} \sum_{i=1}^{s_l} \sum_{j=1}^{s_l + 1} (\Theta_{ji}^{(l)})^2
\end{align*}
        

- Gradient Descent for Neural Network:
    - algorithmn on finding the minimal the Cost Function / Optimization Objective
    
#### Gradient Descent: Back Propagation Algorithm
- returning the error rate (Cost Function / Optimization Objective value) to back to the first layer, in order for the
first layer to change the original weight value with respect to the returned error rate
- "Backpropagation" is neural-network terminology for minimizing our Cost Function / Optimization Objective, just like what we were doing with gradient descent in logistic and linear regression.

- Inutition: delta = "error of activation function" or "error of cost" of node j in layer l
- For each output unit (layer L=4)
\begin{align*}
\delta_j^{(4)} = a_j^{(4)} -y_j
\end{align*}
\begin{align*}
\delta_j^{(3)} = (\Theta^{(3)})^T \delta^{(4)} .* g'(z^{(3)})
\end{align*}
\begin{align*}
\delta_j^{(2)} = (\Theta^{(2)})^T \delta^{(3)} .* g'(z^{(2)})
\end{align*}
where:
\begin{align*}
 g' (g​ ​prime) = activation ​function
\end{align*}
`note`: no delta one for first layer because it corresponds to the input layer or the values for features which values must not be changed 
    \begin{align*}
    \delta_j^{(1)}
    \end{align*}

vectorized implementation:
    \begin{align*}
    \Delta_{i,j}^{(l)} := \Delta^{(l)} + \delta^{(l+1)}(a^l)^T
    \end{align*}

#### Random Intialization
- `Symmetry breaking`
    - initializing each `theta weights` to a random value
\begin{align*}
[  ​-\epsilon, \epsilon ​ ]
\end{align*}
\begin{align*}
-\epsilon \leq \Theta_{ij}^{(l)} \leq \epsilon
\end{align*}
    
- initializing value at `zeros` will work for Logisitic regression but not on Network
#### Training a Neural Network
1. Pick a network architecture (connectivity pattern between neurons)
1. Number of input units: Dimension of features
1. Number of ouput units: Number of classes
    - Reasonable default:
        - 1 hidden layer
        - if > 1 hidden layer, have same number of units in every layer
            - the more hidden units the better
            - neural units for hidden layer is usually 2-3x the number of input units
1. Randomly initialize weights
1. Implement forward propagation to get `ℎΘ(𝑥⁽ⁱ⁾` for any 𝑥⁽ⁱ⁾
1. Implement code to compute Cost Function / Optimization Objective 𝐽(θ)
1. Implement backward propagation to compute partial derivates

    \begin{align*}
     \frac{∂}{∂\Theta_{jk}^{(l)}} J(\Theta)
    \end{align*}

1. Use gradient checking to compare partial derivates computed using backpropagation vs using numerical estimate of gradient of  𝐽(θ)
    - then disable gradient checking code
1. Use gradient descent or advanced optimization method with backpropagation to try to minimize  𝐽(θ) as a function of parameters Θ


## Week 6 - Machine Learning System Design

### Evaluating Learning Algorithm and Hypothesis 

- if hypothesis makes unacceptable errors
1. Steps in Debugging Learning Algorithm
    1. Get more training examples
    1. Try smaller sets of featuers
    1. Try additional features
    1. Try additing polynomial features
    1. Try decreasing lambda (regularization)
        - fixes high bias 
    1. Try increasing lambda (regularization)
        - fixes high variance
        
1. Choosing networks 
    1. Small neural netowrk
        - few parameters
        - prone to underfitting
        - computationally cheaper
    1. Large neural netowrk
        - more parameters
        - more hidden layers
        - prone to overfitting` 
            - use regularization
        - computationally expensive 
    


### Machine Learning Diagnostics
- can take time to implement but cost effective
- a diagnostic can sometimes rule out certain courses of action (changes to your learning algorithm) as being unlikely to improve its performance significantly.
    
 
### Model Selection and Train/Validation/Test Sets 
1. Steps Model Selection Problem
    1. divide the training sets into
        - 60% as training set
        - 20% as validation set
        - 20% as test set
    1. compute the error for each data set
        - training set error
            \begin{align*}
             J_{train}(\Theta) = \frac{1}{2m} \sum_{i=1}^m (h_{\theta}(x^{(i)}) - y^{(i)})^2
            \end{align*}
        - validation set error
            \begin{align*}
             J_{cv}(\Theta) = \frac{1}{2m_{cv}} \sum_{i=1}^{m_{cv}} (h_{\theta}(x_{cv}^{(i)}) - y_{cv}^{(i)})^2
            \end{align*}
        - test set error
            \begin{align*}
             J_{test}(\Theta) = \frac{1}{2m_{test}} \sum_{i=1}^{m_{test}} (h_{\theta}(x_{test}^{(i)}) - y_{test}^{(i)})^2
            \end{align*}
    1. use the data in `validation set` to select the model
        1. substitute all parameters with each polynomial order
        1. select polynomial order with lowest error
    1. use the model and use in the test set
- `note`: cross validation set will generally have lower error than the test set because of model fitting


### Bias vs Variance
1. High Bias
    - `underfit`
    - 𝐽𝑡𝑟𝑎𝑖𝑛(𝜃) is high
    - 𝐽𝑐𝑣(𝜃) ≈ to 𝐽𝑡𝑟𝑎𝑖𝑛(𝜃)
1. High Variance
    - `overfit`
    - 𝐽𝑡𝑟𝑎𝑖𝑛(𝜃) will be low
    - 𝐽𝑐𝑣(𝜃) greater than 𝐽𝑡𝑟𝑎𝑖𝑛(𝜃) 
    
### Bias vs Variance - Regularization
1. Choosing the regularization parameter labmda
    1. initialize lambda values by iteration
        - e.g
            - Try 𝜆 = 0
            - Try 𝜆 = 0.01
            - Try 𝜆 = 0.02
            - ..
            - ..
            - Try 𝜆 = 10
    1. Iterate through the λs and for each λ go through all the models to learn some Θ.
    1. Test the hypothesis using the `validation set`
    1. Compute the cross validation error using the 𝐽𝑐𝑣(Θ) without regularization or λ = 0
    1. Select the best combo that produces the lowest error on the cross validation set 
    1. Use the lambda value and apply it on 𝐽𝑡𝑒𝑠𝑡(Θ) on `test set` 

- High Bias (`underfit`)
    - if large  labmda value
        - large value would make the theta (parameters) close to zero value, thus making ℎΘ(𝑥) = 𝜃₀
- High Variance (`overfit`)
        - if small labmda value
    
### Learning Curves
- Experiencing high bias
    1. *Low training set size*: 
        - causes 𝐽𝑡𝑟𝑎𝑖𝑛(Θ) to be lower and 𝐽𝑐𝑣(Θ) to be high
    1. *Large training set size*: 
        - causes both 𝐽𝑡𝑟𝑎𝑖𝑛(Θ) and 𝐽𝑐𝑣(Θ) to be high
        - 𝐽𝑡𝑟𝑎𝑖𝑛(Θ) ≈ 𝐽𝑐𝑣(Θ) 
    - `note`: small training set size means also small training error
    - `note`: if learning algorithm is suffering from high bias, getting more data will not by itself help much
    - `note`: small training set will not generalized well
    
- Experiencing high variance 
    1. *Low training set size*: 
        - causes 𝐽𝑡𝑟𝑎𝑖𝑛(Θ) to be low and 𝐽𝑐𝑣(Θ) to be high
    1. *Large training set size*: 
        - 𝐽𝑡𝑟𝑎𝑖𝑛(Θ) increases with training set size and 𝐽𝑐𝑣(Θ) continues to decrease without leveling off. 
        - 𝐽𝑡𝑟𝑎𝑖𝑛(Θ) < 𝐽𝑐𝑣(Θ) but the difference between them remains significant 
    - `note`: if learning algorithm is suffering from high variance, getting more data is likely to help 
    

### Prioritization of Work

#### e.g Building a spam classifier
- supervised learning
    - x = features of email
        - i.e feature vector
        - e.g list of words indicative of spam/not spam
            - e.g. deal, buy, discount
    - y = spam(1) or not spam(0)
- how to spend time make it have low error
    - collect lots of data
    - develop sophisticated features based on email routing information
        - from email header
- develop sophisticated features from message body
- develop sophisticated algorithm to detect misspelling


### Error Analysis
#### Recommended approach for building Machine Learning 
1. Start with simple algorithm
    - spend 1 day and test on cross-validation data
1. Plot learning curves to decide if more data more features, etc will help
    - to avoid premature optimization
1. Error analysis
    - manually examining the samples (in `cross validation set`) that algorithm made errors on.
    - creatre classification of errors and tally 
    - see if systematic patterns are amking errors on
1. Compare against the chosen Numerical Evaluation/Metric

### Error Metrics for Skewed Data/Classes
#### Evaluation Metrics: Precision/Recall for Skewed Classes
1. Precision
    - e.g. of the shoes classified as Nike, how many are actually Nike?
    - e.g. predict cancer only when confident
    \begin{align*}
    \frac{true ​ positives}{number ​ of ​ predicted ​ positive}
    \end{align*}

    \begin{align*}
    \frac{True ​ positive}{True ​ positive ​ + ​ False ​ positive}
    \end{align*}
1. Recall 
    - e.g of the shoes that are actually Nike, how many were classified as Nike?
    - e.g. when in doubt patient have cancer, conclude with cancer
    \begin{align*}
    \frac{true ​ positives}{number ​ of ​ actual ​ positive}
    \end{align*}

    \begin{align*}
    \frac{True ​ positive}{True ​ positive ​ + ​ False ​ negative}
    \end{align*}

1. F Score
    - Formula 1
    \begin{align*}
    F_\beta = \frac{1}{\beta x \frac{1}{Precision} + (1-\beta)x\frac{1}{Recall} }
    \end{align*}
        - 𝛽 is threshold value
    
    - Formula 2
    \begin{align*}
    F_1 Score = 2\frac{PR}{P + R}
    \end{align*}
    
#### Evaluation Metrics: Trade Off Precision/Recall 
- e.g. Logistic Regression for Cancer prediction
    - Suppose we want to predict cancer, only if very confident (assure true positives)
        - higher precision, lower recall
    - Supopose we want to avoid missing too many cases of cancer (avoid false negatives)
        - lower precision, higher recall
        
#### Large Datasets 
1. Large data Rationale
    - useful if the task is easy for human-level accuracy
    - if learning algorithm have many parameters (low bias algorithm)
        - e.g neural network with many hidden layer, logistic/linear regression
        
## Week 7 - Support Vector Machines
- doesn't output a probability
- `very sensitive to outliers`
- also known as `Large Margin Classifier`
    - consequence of optimization 
- just makes a prediction if y = 0 or 1
- 1-dimension data (i.e. x-axis) is transformed by kernel to draw  data into 2 or higher dimension to find the `support vector classifier`

- Kernel Functions ( `Similiary functions`)
    - systematicaly finds Support Vector Classifiers
    1. Linear Kernel
        - no kernel
    1. Gaussian Kernel 
        - most common
        - do perform feature scaling before using this kernel
    1. Radial Kernel
    1. Polynomial Kernel
- Terminologies
    1. Support Vector Margin
    1. Kernel Trick
    1. Soft margin

### SVM Cost Function / Optimization Objective
\begin{align*}
\frac{min}{\theta}C \sum_{i=1}^m[y^{(i)}cost_1(\theta^T x^{(i)})] + (1-y^{(i)}) cost_0 (\theta^T xT^{(i)})] + \frac{1}{2} \sum_{i=1}^n \theta_j^2
\end{align*}

### SVM parameters 
1. Lambda
\begin{align*}
C(=\frac{1}{\lambda})
\end{align*}
    - Large C
        - lower bias, high variance
    - Small C
        - higher bias, low variance
2. Sigmoid squared
\begin{align*}
\sigma^2
\end{align*}
    - Large Sigmoid: 
        - features f vary more smoothly
        - higher bias, lower variance
    - Small Sigmoid: 
        - features f vary less smoothly
        - lower bias, higher variance
        
### SVM in Practice
- Implementation Tips
    1. Specify parameter C
    1. Specify choice of Kernel (similarity function)
        - e.g. No kernel, Gaussian Kernel, etc.
        
## Week 2 - Unsupervised Learning - Introduction
- given an unlabeled dataset and are asked to find "structure" in the data
- the training set is of the form 
    \begin{align*}
    \{x^{(1)},x^{(2)},\dots,x^{(m)}\} 
    \end{align*}
    without labels 
    \begin{align*}
    y^{(i)}
    \end{align*}

### K-Means Algorithm
- most popular Clustering
- iterative algorithm and does 2 things
    1. cluster assignment step
    1. move centroid step
        - inner loop step
        
- Notations:
    - Input
        - index cluster (1,2,...K) to which example 𝑥⁽ⁱ⁾ is currently assigned
            \begin{align*}
            c^{(i)}
            \end{align*}
        - index cluster (1,2,...K) to which example 𝑥⁽ⁱ⁾ has been assigned
            \begin{align*}
            \mu_c^{(i)}
            \end{align*}
        - K - total number of clusters
            \begin{align*}
            \mu_1, \mu_2, ...., \mu_K ∈ ℝ^n  
            \end{align*}
        - k - specific cluster centroid
            \begin{align*}
            \mu_k, \mu_k ∈ ℝ^n  
            \end{align*}
        - Training set
            \begin{align*}
            \{x^{(1)},x^{(2)},\dots,x^{(m)}\} 
            \end{align*}
            \begin{align*}
            x^{(i)} ∈ ℝ^n  
            \end{align*}
       
- Steps
    1. Randomly initialized K cluster centroids 
    1. Assign each data point to one of the K centroid (Cluster Assignment Step)
    1. Move the centroids to new posiiton based on the average/mean of the location of each points (Move Centroid Step)
    1. Re-assigne each data point to one of the 2 centroid
    1. Repeat step 3-5
    
- Algorithm 
    - Repeat 
        {
            for i = 1 to m 
                𝑥⁽ⁱ⁾ := index (from 1 to K) of cluster centroid closest to 𝑥⁽ⁱ⁾
            for k = 1 to K 
                𝜇𝑘 := average (mean) of points assigned to cluster k
        }

### K-Means Cost Function / Optimization Objective
- Optimizaiton Function (Distortion Function)
\begin{align*}
min_{c^{(1)},...,c^{(m)}} J (c^{(1)}, ..., c^{(m)},\mu_1,...,\mu-K) = \frac{1}{m}\sum_{i=1}^m ||x^{(i)} - \mu_c(i)||^2
\end{align*}

### K-Means Initialization
- Steps
    1. Should have K < m
    1. Pick k distinct random integers i {1,...,m} from training examples
    1. Set 𝜇1,𝜇2,....,𝜇𝐾 equal to these K examples
    
- Algorithm 
    ```
    For i = 1 to 1000 {
            Randomly initialize K-means
            Run K-means
                Get J(𝑐(1),...,𝑐(𝑚),𝜇1,...,𝜇−𝐾)
            Compute the Cost Function / Optimization Objective(distortion)
                J(𝑐(1),...,𝑐(𝑚),𝜇1,...,𝜇−𝐾)
    }
    
    Pick clustering that gave lowest Cost J(𝑐(1),...,𝑐(𝑚),𝜇1,...,𝜇−𝐾)
    ```
    
### K-Means Cluster 
- Techniques of choosing the right value of K
    1. Elbow Method
        - Distortion (Cost Function / Optimization Objective) goes down as more clusters are created
        - the `elbow` or joint point will be the suggested number of cluster
        - wil not always work
    1. Metric based
    
## Week 7 - Dimensionality Reduction
- practical application
    1. Data compression
        - Reduce memory/disk needed to store data
        - Speed up learning algorithm
            - still retains percentage of variance of original data 
    1. Data Visualization 
- use if the plotting dimensions is impossible to graph
    - e.g. x-axis + y-axis + z-axis + n-axis
- Types of Dimensionlity Reduction
    1. Feature Selection
        - Neural Network
    1. Feature Extraction
        - Principal Component Analysis (PCA)
        - Heatmaps
        - t-SNE Plots (Supervised)
        - Multi-Dimensional Scaling
        
### Principal Component Analysis 
- Goal
    - find a vector onto which to project the data as to minimize projection error
    
- Techniques 
    1. Data processing
        - Feature Scaling/mean normalization
            - if different features on different scales, scale features to have comparable range of values
            
- Choosing k (number of principal components)
    - "99% of variance is retained"
    
- Bad Application of PCA
    - to prevent overfitting
        - PCA throws away some information (e.g excludes the y value)
        
- Best Practice of Application of PCA
    - try doing implementation without PCA first using the original uncompressed data
    
- Notation
\begin{align*}
 x ∈ ℝ^n ->  z ∈ ℝ^k   
\end{align*}

## Week 8 - Anomaly Detection
### Motivation
- Unsupervised Learning
- most practical application
    1. Fraud detection
        - detects behavior/features of user
            - x1 = how often login 
            - x2 = typing speed
            - x3 = number of transactions 
    1. Manufacturing
    1. Monitoring Computers in Data Center
    
### Gaussian Distribution 
- also known as `normal distribution curve`

- Mean
\begin{align*}
\mu = \frac{1}{m} \sum_{i=1}^m x^{(i)}
\end{align*}

- Variance
\begin{align*}
\sigma^2 = \frac{1}{m} \sum_{i=1}^m (x^{(i)} - \mu)^2
\end{align*}

- Density computation
\begin{align*}
p(x) = \prod_{j=1}^n p(x_j;\mu_j; \sigma_j^2) = \frac{1}{\sqrt{(2 \pi \sigma)}} exp( - \frac{(x-\mu)^2}{2\sigma^2})
\end{align*}

### Anomaly Detection Algorithm
- Steps
    1. have a way of evaluatimg algorithm
        1. Fit model p(x) on training set
        \begin{align*}
            {x^{(i)},...,x^{(m)}}
        \end{align*}
        1. On a cross validation/test exmple x, predict
        \begin{align*}
          y = \left\{ \frac10 \right.
        \end{align*}
        \begin{align*}
            if p(x) < \epsilon  ​ (anomaly)
        \end{align*}
        \begin{align*}
            if p(x) \geq \epsilon ​ (normal)
        \end{align*}
        1. Possible evaluation metrics
            - F1 - Score
            - Precision/Recal
            - True positive, false positive, false negative, true negative
            - Classification accuracy
                - should not be use
                - skewed because y=0 is always higher
        1. Can also use cross validation set to choose parameter epsilon (𝜖) 
    1. have some labeled data of anomalous and non-anomalous
    1. choose or create a features that might usually take on `unusually large or small` values in the event of an anomaly 
    1. Try to come up with more featuers to distinguish between normal and anomalous examples
    1. train in Training set 
    1. train in Cross Validation set
    1. train in Test set
- Data Set distribution (60-20-20 distribution)
    - Training Set: 6000 good (y=0)
    - CV set: 2000 good (y=0), 10 anomalous (y=1)
    - Testset: 2000 good (y=0), 10 anomalous (y=1)
- Density Estimation Formula
    - Training set: 
        \begin{align*}
        {x^{(i)},...,x^{(m)}}
        \end{align*}
    - Each example is  
        \begin{align*}
         x ∈ ℝ^n   
        \end{align*}
    - Formula 
        \begin{align*}
        p(x) = \prod_{j=1}^n p(x_j;\mu_j; \sigma_j^2)
        \end{align*}
    - `Anomaly if p(x) < 𝜖`
    
### Anomaly Detection Problems

| Anomaly Detection (Unsupervised)   | Logistic Regression (Supervised)   |
|---|---|
| Very small positive (y=1) e.g 0-20 | Large number of positive examples  |
| Large number of negative (y=0)     | Large number of negative examples  |
| Many different types of anomalies. Hard for algorithm to learn what new anomalies look like   | Enough examples  to get sense of what positive and negative are |
| future anomalies may look nothing like the existing anomalous examples | future postives are likely to be similar with exisitng dataset |
| Fraud detection | Email Spam Classification |
| Manufacturing   | Weather Prediction (sunny/rainy) |
| Data Center Monitoring |  Cancer Classification |

### Anomaly Detection Features 
#### Non-Gaussian features
- Steps
    1. plot the histogram data
        - non bell curved distribution
    1. Plot as `log(x)` transform  or different transformation constants
    
#### Error Analysis
- steps similar with logistic regression
- Most common problem 
    - p(x) is comparable for normal and anomalous example
  
### Anomaly Detecting using Multivariate Guassian Distriubtion 
- can also be used to model correlation of variables
- elipses or contours are always axis aligned

- Formula
    \begin{align*}
    p(x;\mu;\Sigma) = \frac{1}{ (2\pi)^{\frac{n}{2}} | \Sigma |^{\frac{1}{2} }  }
    exp( - \frac{1}{2} (x-\mu)^T \Sigma^{-1}  (x-\mu)
    \end{align*}
    
    
### Guassian Distriubtion Comparison
 | Original Model   | Multivariate Gaussian   |
|---|---|
|  𝑝(𝑥𝑗;𝜇𝑗;𝜎2𝑗)  | 𝑝(𝑥;𝜇;Σ) | 
| manually combine and creates features to capture anomalies| automatically captures correlation between features |
| computationally cheaper | computationally more expensive |
| scale better to large n | scales lesser |
| Ok even if m is small   | Must have m > n, or else sigma is non-invertible |

## Week 8 - Recommender System 

### Notations
- number of rater (e.g number of users) 
    \begin{align*}
    n_u
    \end{align*}
- number of features (e.g romance, action) 
    \begin{align*}
    n
    \end{align*}
- number of samples (e.g number of movies)
    \begin{align*}
    n_m
    \end{align*}
- rated (e.g if movie `i` was rated by user `j`)
    \begin{align*}
    r(i,j) = 1
    \end{align*}
- ratings score 
    \begin{align*}
    y^{(i,j)}
    \end{align*}
- parameter vector for user `j` 
    \begin{align*}
    \theta^{(j)}
    \end{align*}
- feature vector for movie`i` 
    \begin{align*}
    x^{(i)}
    \end{align*}
- Formula
    \begin{align*}
    (\theta^{(j)})^T (x^{(i)})
    \end{align*}
    
- Cost Function / Optimization Objective 
    \begin{align*}
    min \theta = \frac{1}{2} \sum_{j=1}^{n_u} \sum_{i:r(i,j) = 1} ( (\theta^{(j)})^T x^{(i)} - y^{(i,j)}  )^2 
    + \frac{\lambda}{2}  
    \sum_{j=1}^{n_u} \sum_{k=1}^n (x_k^{(j)})^2
    \end{align*}
    
- Gradient Descent Update Rule
    \begin{align*}
    x_k^{(i)} := x_k^{(i)} - \alpha ( \sum_{j:r(i,j) = 1} ( (\theta^{(j)})^T ) ( x^{(i)} ) - y ^{(i,j)} ) \theta_k^{(j)} + \lambda x_k^{(i)} )
    \end{align*}
    
### Collaborative Filtering Algorithm
- essentially used predict the score of a movie based on the scores of other users
- Steps
    1. Initialize to small random values
    1. Minimize using gradient descent
    1. For a user with paremters theta and a movie with (learned) feature x, predict star rating of 𝜃𝑇𝑥(𝑖)
    
### Vectorization: Low Rank Matrix Factorization
- essentially used to recommend a new movie to a user

## Week 10 - Learning with Large Dataset
- Steps
    1. Sanity Check by iterating multiple and small dataset
        - plot the learning curve
            - because some algorithm does not improve by just adding data
            
### Methods for Scaling Datasets
1. ### Stocahstic Gradient Descent 
    - useful when there are a lot of redundancies in the data
    - modification for Gradient Descent for large data
    - doesn't really converge on global minimum - but fine enough
    
    - Recall Gradient Descent for Linear Regression
        - Hypothesis 
        \begin{align*}
        h_0(x) = \sum_{j=0}^n \theta_j x_j
        \end{align*}
        - Cost function 
        \begin{align*}
        j(θ₀,θ₁) = \frac{1}{2m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)²
        \end{align*}

        - Gradient Descent Formula
        \begin{align*}
        \theta_j:=\theta_j-\alpha \frac{∂}{∂\theta_j} j(\theta_0, \theta_1)​ 
        \end{align*}

        - thus, derive the Batch Gradient Descent Update Formula: 
            - repeat until converge {
                \begin{align*}
                \theta_0:=\theta_0-\alpha \frac{1}{m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)
                \end{align*}
                \begin{align*}
                \theta_1:=\theta_1-\alpha \frac{1}{m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)x⁽ⁱ⁾
                \end{align*}
            } simultaneously update (θ₀,θ₁) 


1. ### Mini-batch Gradient Descent 
- Batch Gradient Descent: uses all `m` examples in each iteration
- Stochastic Gradient Descent: uses 1 example in each iteration
- Mini-batch Gradient Descent: uses `batch` (i.e 2-100 examples) in each iteration
    - better than stochastic if vectorized
    - uses parallelism
    - Say b = 10, m = 1000
    - Repeat {
        - for i = 1, 11, 21, 31, ..., 991 
        \begin{align*}
        \theta_j := \theta_j - \alpha \frac{1}{10} \sum_{k=i}^{i+9} ( h_{\theta} ( x^{(k)}) - y^{(k)} ) x_j^{(k)}
        \end{align*}
    } (for every j = 0, ..., n)

    
## Week 10 - Advance Topics
### Online Learning
- learn from the flood of users
- to learn from continuous stream of data

### Map Reduce and Data Parallelism
- Map Reduce: distributing the datasets across different machines
- Parallism: Computes the algorithm at the same time on different or same machine
    - learning algorithm must be express as computing sums of funcitons over the training set
    
## Week 11 - Photo OCR

### OCR Pipeline
- Steps
    1. Text detection
    1. Character segmentation
    1. Character classification  - Terminology
    - Sliding Window
        - Step size/stride
        
### Getting More Data Guidelines
1. Plot learning Curve first
1. "How much work would it be to get 10x as much data"
    - artificial data synthesis
    - collect/label it yourself
        - compute man hours
    - crowd source (e.g Amazon Mechanical Turk)
        - crowd source data labelling
        
### Ceiling Analysis
- estimating errors due to each component
- allocation of resources in choosing components in the pipeline to improve
- having a single number for evaluation metric for each component
    - e.g
       | Component              | Accuracy | Difference |
       | ---                    | ---      | ---        |
       | Overall                | 72%      | 0          |
       | Text Detection         | 89%      | 17%        |
       | Character Segmentation | 90%      | 1%         |
       | Character Recognition  | 100%     | 10%        |