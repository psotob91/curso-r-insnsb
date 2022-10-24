set.seed(123)
biomarcador <- rnorm(100, 100, 2)
biomarcador2 <- biomarcador * 1.2 + rnorm(100, 0, 0.5)
plot(biomarcador, biomarcador2)

y <- biomarcador2 * 5 + rnorm(100, 0, 2)

mod1 <- lm(y ~ biomarcador)
summary(mod1)

mod2 <- lm(y ~ biomarcador2)
summary(mod2)

mod3 <- lm(y ~ biomarcador + biomarcador2)
summary(mod3)


