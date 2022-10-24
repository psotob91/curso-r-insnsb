# Animacion 3D

library(tidyverse)
library(car)
library(rgl)
library(patchwork)


### Regresion Lineal con Predictores Lineales:

set.seed(123)
z <- rnorm(50, 0, 0.05)
w <- rnorm(50, 0, 0.05)
y <- 10 - 20 * z + 15 * w +  rnorm(50, 0, 0.05)

datos <- data.frame(
  x1 = factor(x, levels = c(0, 1), labels = c("Placebo", "Tratamiento Nuevo")), 
  x2 = x, 
  x3 = z, 
  x4 = w,
  y = y)


datos %>% 
  ggplot(aes(x = x3, y = y)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) + 
  theme_classic() -> p1

datos %>% 
  ggplot(aes(x = x4, y = y)) + 
  geom_point() + 
  geom_smooth(method = "lm", se = FALSE) + 
  theme_classic() -> p2

p1 + p2

scatter3d(datos$x3, datos$y, datos$x4)


### Regresion Lineal con Predictores No Lineales:

set.seed(123)
z <- -50:50
y <- 10 + 2 * z - 1 * z ^ 2 

datos <- data.frame(
  x = z, 
  y = y)

datos %>% 
  ggplot(aes(x = x, y = y)) + 
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE) + 
  theme_classic() -> p1

datos %>% 
  ggplot(aes(x = x ^ 2, y = y)) + 
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE) + 
  theme_classic() -> p2

p1 + p2

scatter3d(datos$x, datos$y, datos$x ^ 2)

### Regresion Lineal con Predictores No Lineales:

set.seed(123)
z <- -50:50
y <- 10 + 2 * z - 1 * z ^ 2 + rnorm(101, 0, 100)

datos <- data.frame(
  x = z, 
  y = y)

datos %>% 
  ggplot(aes(x = x, y = y)) + 
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE) + 
  theme_classic() -> p1

datos %>% 
  ggplot(aes(x = x ^ 2, y = y)) + 
  geom_point() + 
  geom_smooth(method = "loess", se = FALSE) + 
  theme_classic() -> p2

p1 + p2

scatter3d(datos$x, datos$y, datos$x ^ 2)