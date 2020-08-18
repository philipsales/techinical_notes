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
        - Statistic: y     = bX   + a
        - θ₀'s is `y-intercept` (a)
        - θ₁ is `slope` (bX)
    - parameters: θᵢ's `thetas`
    - problem: how to choose θᵢ's 
    
#### Cost Function Intution I 
- Linear Hypothesis Formula: 
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
- Goal: minimize J(θ₀,θ₁) 

#### Cost Function Intution II: Contour Plots 
- also also called `contour figures`

### Gradient Descent 
- algo use to minimize the cost functions and other functions

Gradient Descent Formula
\begin{align*}
\theta_j:=\theta_j-\alpha \frac{∂}{∂\theta_j} J(\theta_0, \theta_1)​ 
\end{align*}
parameters
\begin{align*}
j =0,1 ​=> index \ number
\end{align*}
\begin{align*}
\alpha ​=> learning \ rate  
\end{align*}
\begin{align*}
\frac{∂}{∂\theta_1} J(\theta_0, \theta_1)​=> partial derivative 
\end{align*}
\begin{align*}
\frac{d}{d\theta_1} J(\theta_0, \theta_1)​=> derivative 
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
- will automatically take smaller steps as approaches the local minimum
- if too small, will be to slow
- if too large, can overshoot the minimum and may not converge

### Gradient Descent For Linear Regression 
- Gradient susceptible to local optima but not in linear regression
- Cost function for linear regression is always to 
    - `Convex function` - also called 'Bowl shaped function'
        - doesn't have local optima or any other optima
- usually paremeters is initialized in (0,0) for (θ₀,θ₁)



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
    - not all numbers have an inverse (e.g. zero)
        - 0 (0⁻¹) = undefined
        - also called `singular` or `degenrate` matrix
1. Matrix Transpose
    - Bᵢⱼ = Aⱼᵢ
        
        | 1 2 0 |          
    A = | 3 5 9 |     
    
         | 1 3 |
    Aᵀ = | 2 5 |
         | 0 9 |