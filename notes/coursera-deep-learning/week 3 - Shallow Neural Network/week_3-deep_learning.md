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

## Week 3 - Shallow Neural Network

### Neural Network Representation
- Hidden Layer
    - true values are not observed as compared to input layer and output layer

- Representation - 2 Layer Neural Network
    
    ![image info](../images/shallow-neural-network.png)
    
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

    ![image info](../images/compute-neuron.png)
    
    
    
- 1st Layer - 1st Node computation

    ![image info](../images/compute-1st_node-1st_layer.png)
    
    - Formula:
        \begin{align}
        z_1^{[1]} & = w_1^{[1]T} x + b_1^{[1]} \\
        a_1^{[1]} & = \sigma( z_1^{[1]})
        \end{align}
    
- 1st Layer - 2nd Node computation

    ![image info](../images/compute-2nd_node-1st_layer.png)
    
    - Formula:
        \begin{align}
        z_2^{[1]} & = w_2^{[1]T} x + b_2^{[1]} \\
        a_2^{[1]} & = \sigma( z_2^{[1]})
        \end{align}
        
- 1st Layer - All Nodes computation

    ![image info](../images/compute-all_node-1st_layer.png)
    
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