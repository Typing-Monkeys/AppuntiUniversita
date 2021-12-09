n1 = sample(300:350, 1)
n2 = sample(650:700, 1)

E = rep(-0.15, times = n1)
F = rep(-0.1, times = n2)
G = rep(0.1, times = n2)
H = rep(0.15, times = n1)

R = c(E,F,G,H)
r = sample(R, 200, replace = TRUE)

boxplot(R, main = "R")
boxplot(r, main = "r")

boxplot(r,R, varwidth = TRUE, names = c("r", "R"))

v = sample(-1000:0, 200, replace = FALSE)
v = v*10^-3

w = (v+r)^2