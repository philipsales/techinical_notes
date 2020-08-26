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

### Cost Function 
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
    
#### Cost Function Intution I 
- Hypothesis Formula for single feature (Linear Regression): 

\begin{align*}
hθ(x) = θ₀ +  θ₁x
\end{align*}
- Parameters: 
\begin{align*}
θ₀,θ₁
\end{align*}
- Cost Function formula: 
\begin{align*}
J(θ₀,θ₁) = \frac{1}{2m} \sum_{i=1}^m (h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)²
\end{align*}

- Goal: 
\begin{align*}
minimize ​ J(θ₀,θ₁) 
\end{align*}

### Gradient Descent 
    - algo use to minimize the cost functions and other functions

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
- Cost function for linear regression is always to 
    - `Convex function` - also called `Bowl shaped function`
        - doesn't have local optima or any other optima
- usually paremeters is initialized in (0,0) for (θ₀,θ₁)

- Cost Function Formula: 
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

- Cost Function Formula: 
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
        - xᵢ (input) - μᵢ (average of all values for feature (i)) / sᵢ (range)
        
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
### Cost Function
- Logistic Cost Function
\begin{align*}
J(\theta) = \frac{1}{m} \sum_{i=1}^m Cost(h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)
\end{align*}

\begin{align*}
Cost(ℎθ(𝑥),y) = -log(ℎθ(𝑥))​​if​y=1
\end{align*}

\begin{align*}
Cost(ℎθ(𝑥),y) = -log(1-ℎθ(𝑥))​​if​y=0
\end{align*}

- Logistic Cost Function conditions
    - `Cost(hθ(x),y)=0 if hθ(x) = y`
    - `Cost(hθ(x),y)→∞ if y=0 and hθ(x)→1`
    - `Cost(hθ(x),y)→∞ if y=1 and hθ(x)→0`
    
- Simplified Logistic Regression Cost Function 

    Original formula:
    \begin{align*}
    J(\theta) = \frac{1}{m} \sum_{i=1}^m Cost(h₀(x⁽ⁱ⁾) - y⁽ⁱ⁾)
    \end{align*}
    
    Converted Cost Function
    \begin{align*}
    Cost(hθ(x),y) = -y*log(hθ(x)) - (1-y)log(1-hθ(x))
    \end{align*}

    Conditional Cost Function
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
    - very strong preconception/bias to fit a straight line
1. Overfitting 
    - "high variance"
        - term `variance` is historical
    - it can fit almost any function and this face of possible hypothesis is just too large, it's too variable.  
    - fails to generalize to new examples
    
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
### Regularization - Cost Function 
- Regularized Cost Function Formula: 

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
    
    
#### Regularization - Cost Function
- Regularized Cost Function for Logistic Regression:

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
    
- matrix of weights controlling funciton mapping from layer j to layer j+1
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

#### Regularization - Cost Function
- Regularized Cost Function for Neural Network:

\begin{align*}
J(\Theta) = - \frac{1}{m} [\sum_{i=1}^m \sum_{k=1}^K y_k^{(i)} log(h_\Theta(x^{(i)}))_k + (1-y_k^{(i)})log(1-h_\Theta(x^{(i)}))_k) ] ​ + \frac{\lambda}{2m} \sum_{l=1}^{L-1} \sum_{i=1}^{s_l} \sum_{j=1}^{s_l + 1} (\Theta_{ji}^{(l)})^2
\end{align*}
        

- Gradient Descent for Neural Network:
    - algorithmn on finding the minimal the cost function
    
#### Gradient Descent: Back Propagation Algorithm
- returning the error rate (cost function value) to back to the first layer, in order for the
first layer to change the original weight value with respect to the returned error rate
- "Backpropagation" is neural-network terminology for minimizing our cost function, just like what we were doing with gradient descent in logistic and linear regression.

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
1. Implement code to compute cost function 𝐽(θ)
1. Implement backward propagation to compute partial derivates

    \begin{align*}
     \frac{∂}{∂\Theta_{jk}^{(l)}} J(\Theta)
    \end{align*}

1. Use gradient checking to compare partial derivates computed using backpropagation vs using numerical estimate of gradient of  𝐽(θ)
    - then disable gradient checking code
1. Use gradient descent or advanced optimization method with backpropagation to try to minimize  𝐽(θ) as a function of parameters Θ


## Week 6 - Machine Learning System Design

### Deciding What to Try Next
- if hypothesis makes unacceptable errors
    1. Debugging
    1. Get more training examples
    1. Try smaller sets of featuers
    1. Try additional features
    1. Try additing polynomial features
    1. Try decreasing lambda (regularization)
    1. Try increasing lambda (regularization)
    
### Evaluating Learning Algorithm and Hypothesis 


### Machine Learning Diagnostics
- can take time to implement but cost effective
- a diagnostic can sometimes rule out certain courses of action (changes to your learning algorithm) as being unlikely to improve its performance significantly.
    

### Model Selection and Train/Validation/Test Sets 
1. Model Selection
    - what degree of polynomial to select
    

