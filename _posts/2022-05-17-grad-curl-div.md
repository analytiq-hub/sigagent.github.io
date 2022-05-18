---
layout: post
mathjax: true
categories: math
title: "Gradient. Curl. Divergence."
---
In [Lecture 9](https://www.youtube.com/watch?v=WJn6h-6MMa8&list=PL47F408D36D4CF129&index=9), Leonard Susskind reviews gradient, curl and divergence. He says that the curl of a gradient is zero; and, furthermore, if the curl of a vector field is 0, then that vector field is a gradient.

Why is that?

The [wiki page for curl](https://en.wikipedia.org/wiki/Curl_(mathematics)#cite_note-8) explains this indirectly. Let's spell this out.

We start with the operator $$\vec{\nabla} = (\frac{\partial}{\partial x}, \frac{\partial}{\partial y}, \frac{\partial}{\partial z})$$. This is an operator on functions $$f \colon \mathbb{R}^3 \rightarrow \mathbb{R}$$.

The operator $$\nabla$$ is called *nabla*, or, abbreviated, *del*, and is written as an upside-down triangle. 

## Gradient

Gradient is defined for functions $$f \colon \mathbb{R}^3 \rightarrow \mathbb{R}$$ as
$$
\begin{align}
grad(f) = (f_x, f_y, f_z)
\end{align}
$$
which is a vector field on $$\mathbb{R}^3$$. Here, $$f_x, f_y, f_z$$ are the $$x, y, z$$ partial derivatives of the function $$f$$.

The gradient is intepreted as the direction and rate of fastest increase.

Another way to write the gradient is $$grad(f) = \vec{\nabla} f$$, or, using another expresion for the partial derivative notation,
$$
\begin{align}
\vec{\nabla} f = (\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z})
\end{align}
$$

## Curl

Curl is defined for vector fields $$F \colon \mathbb{R}^3 \rightarrow \mathbb{R}^3$$ to be the $$\mathbb{R}^3$$ vector field
$$
\begin{align}
curl(F) = (\frac{\partial F_z}{\partial y} - \frac{\partial F_y}{\partial z}, \frac{\partial F_x}{\partial z} - \frac{\partial F_z}{\partial x}, \frac{\partial F_y}{\partial x} - \frac{\partial F_x}{\partial y})
\end{align}
$$
Here $$F_x, F_y, F_z$$ are the $$x, y, x$$ coordinates of the vector field $$F$$.

Expressed as a determinant of operators $$\frac{\partial}{\partial x}, \frac{\partial}{\partial y}, \frac{\partial}{\partial z}$$, and denoting $$\mathbf{i}, \mathbf{j}, \mathbf{k}$$ the unit vectors along the $$x, y, z$$ axis, the curl can be expressed in the more easily memorized form

$$
\begin{align}
curl(F) =
\begin{vmatrix}
\mathbf{i} & \mathbf{j} & \mathbf{k} \\ 
\frac{\partial}{\partial x} & \frac{\partial}{\partial y} & \frac{\partial}{\partial z} \\
F_x & F_y & F_z
\end{vmatrix}
\end{align}
$$

Here we abuse somewhat the notation, in that the middle row of the determinant represents operators, not functions (and the operators are applied to the third row). Using the $$\vec{\nabla}$$ notation, we can express this, also by abuse of notation, as the cross product
$$
\begin{align}
curl(F) = \vec{\nabla} \times F
\end{align}
$$

At a point $$x, y, z$$, if we draw parallels to the axes at that point, the curl represents rotation of an infinitesimal area around these parallel lines to the x-axis, y-axis, z-axis.

## Divergence

The divergence of a vector field $$F \colon \mathbb{R}^3 \rightarrow \mathbb{R}^3$$ is the function $$div(F) \colon \mathbb{R}^3 \rightarrow \mathbb{R}$$ given by

$$
\begin{align}
div(F) = \frac{\partial F_x}{\partial x} + \frac{\partial F_y}{\partial y} + \frac{\partial F_z}{\partial z}
\end{align}
$$

The divergence at a point represents the extent to which the vector field behaves like a source at that point. If the vector field corresponds to the flow of an incompressible fluid, for example, its divergence will be zero.

[Lecture 7](https://www.youtube.com/watch?v=lQIbcV6dQzw&list=PL47F408D36D4CF129&index=7) in leonard Susskind's classical mechanics course proves that the gradient of motion given by a Hamiltonian in phase space is zero (this is the Liouville Theorem).

In terms of $$\vec{\nabla}$$, again by abuse of notation, we can express the divergence as a dot product

$$
\begin{align}
div(F) = \vec{\nabla} \cdot F
\end{align}
$$


## Relations between gradient, curl, divergence


