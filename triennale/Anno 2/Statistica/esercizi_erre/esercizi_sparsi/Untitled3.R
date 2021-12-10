set.seed(100)
popolazione = read.table("umidita.txt", header = TRUE)
M19 = mean(popolazione$u19)

#punto 1
indici = sample(1:100, 11, replace = FALSE)
campione = popolazione[indici,]

summary(campione)
var(campione$u7)
var(campione$u19)

#punto 2
dati = campione$u7
L_pois = function(theta){
  theta^sum(dati)*exp(-theta*length(dati))/prod(factorial(dati))
}
L_log_pois= function(theta){
  sum(dati)*log(theta)+(-theta*length(dati))-sum(log(factorial(dati))) 
}

lambda = optimize(L_log_pois, c(min(dati), max(dati)),  maximum = TRUE)$maximum

q = quantile(popolazione$u7, 0.05)


prob = ppois(q, lambda) - dpois(q, lambda)

#punto 3
mu = mean(campione$u19)
sigma2 = var(campione$u19)
sd = sqrt(sigma2)
qnorm = quantile(popolazione$u19, 0.90)

prob_norm = 1 - pnorm(qnorm, mean = mu, sd = sd)

#punto 4
intervallo = t.test(campione$u19, mu = M19, conf.level = .99)$conf.int

#punto 5



cor(campione$u19, campione$u7)^2
x = campione$u7
y = campione$u19
reg = lm(y ~ x)

u19_star = predict(reg, data.frame(x))

#punto 6

mean(u19_star)
M19

#H1: mu > M19

t.test(u19_star, mu = M19, conf.level = .99, alternative = "greater")






