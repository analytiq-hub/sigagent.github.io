---
layout: post
mathjax: true
categories: math
title: "Gradient. Curl. Divergence."
---
In [Lecture 9](https://www.youtube.com/watch?v=WJn6h-6MMa8&list=PL47F408D36D4CF129&index=9), Leonard Susskind reviews gradient, curl and divergence. He says that the curl of a gradient is zero; and, furthermore, if the curl of a vector field is 0, then that vector field is a gradient.

Why is that?

The [wiki page for curl](https://en.wikipedia.org/wiki/Curl_(mathematics)#cite_note-8) explains this indirectly. Let's spell this out.

## Gradient

Gradient is defined for functions $$f \colon \mathbb{R}^3 \rightarrow \mathbb{R}$$ as
$$
\begin{align}
\vec{\nabla} f = (f_x, f_y, f_z)
\end{align}
$$
which is a vector field on $$\mathbb{R}^3$$. Here, $$f_x, f_y, f_z$$ are the $$x, y, z$$ partial derivatives of the function $$f$$.

The operator $$\nabla$$ is called *nabla*, or, abbreviated, *del*, and is written as an upside-down triangle. The gradient is intepreted as the direction and rate of fastest increase.

Another way to write it is $$\vec{\nabla} f = (\frac{\partial f}{\partial x}, \frac{\partial f}{\partial y}, \frac{\partial f}{\partial z})$$.

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

At a point $$x, y, z$$, if we draw parallels to the axes at that point, the curl represents rotation of an infinitesimal area around these parallel lines to the x-axis, y-axis, z-axis.

## Divergence

The divergence of a vector field $$F \colon \mathbb{R}^3 \rightarrow \mathbb{R}^3$$ is the function $$div(F) \colon \mathbb{R}^3 \rightarrow \mathbb{R}$$ given by

$$
\begin{align}
div(F) = F_x + F_y + F_z
\end{align}
$$
