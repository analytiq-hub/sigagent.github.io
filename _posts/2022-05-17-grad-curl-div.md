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

We will assume all functions are smooth.

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

Bref:
- div of curl is zero
- curl of grad is zero
- and, conversely, if div of a field is zero, the field is a curl
- if curl of a field is zero, the field is a grad

This can be seen by expressing div, curl, grad in terms of differentiation of forms, noting that $$\mathbb{R}^3$$ is contractible, so any closed 2- and 3-form is exact.

More precisely, denote $$\Omega^k(\mathbb{R}^3)$$ the k-differential forms on $$\mathbb{R}^3$$.

The functions $$\mathbb{R}^3 \rightarrow \mathbb{R}$$ are 0-forms, i.e. they are elements in $$\Omega^0(\mathbb{R}^3)$$.

The functions $$\mathbb{R}^3 \rightarrow \mathbb{R}^3$$ can be identified as 1-forms by the identification $$(F_x, F_y, F_z) \rightarrow F_x dx + F_y dy + F_z dz$$.

By this identification, the gradient $$(f_x, f_y, f_z)$$ of a function $$f \rightarrow \mathbb{R}^3 \rightarrow \mathbb{R}$$ corresponds to differentiation $$df = f_x dx + f_y dy + f_x dz$$.

The functions $$\mathbb{R}^3 \rightarrow \mathbb{R}^3$$ can also be identified as 2-forms by the identification $$(F_x, F_y, F_z) \rightarrow F_x dydz + dx F_y dy + dxdy F_z$$.

With this last two indentifications, $$curl(F)$$ corresponds again to differentiation:

$$
\begin{align}
d(F_x dx + F_y dy + F_z dz) = (\frac{\partial F_z}{\partial y} - \frac{\partial F_y}{\partial z}) dydz + (\frac{\partial F_x}{\partial z} - \frac{\partial F_z}{\partial x})dzdx + ( \frac{\partial F_y}{\partial x} - \frac{\partial F_x}{\partial y})dxdy
\end{align}
$$

Finally, functions $$f \colon \mathbb{R}^3 \rightarrow \mathbb{R}$$ can be identified with 3-forms $$fdxdydz$$. With these last two identifications, $$div(F)$$ corresponds again to differentiation:

$$
\begin{align}
d(F_x dydz + dx F_y dz + dxdy F_z) = (\frac{\partial F_x}{\partial x} + \frac{\partial F_y}{\partial y} + \frac{\partial F_z}{\partial z})dxdydz
\end{align}
$$

The operator $$d$$ is closed and, since $$\mathbb{R}^3$$ is contractible, also exact. (Closed means that $$d^2\omega = 0$$ for any form $$\omega; exact means that any closed form $$\omega$$, i.e. satisfying $$d \omega = 0$$, is in the image of $$d$$, i.e., of the form $$\omega = d \omega^{\prime}$$).

This proves our assertions at the top of this paragraph (by the circuitous but elegant route of assuming knowledge of forms and of $$\mathbb{R}^3$$ being contractible).