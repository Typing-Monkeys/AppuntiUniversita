set.seed(6969)
voti = read.table("voti.txt", header = TRUE)

M_A = mean(voti$A)

indici =sample(1:100, 20, replace = FALSE)
x = voti[indici,]

likS= function(theta) theta^sum(x$S)*exp(-theta*length(x$S))/prod(factorial(x$S))
hat_lambda = optimize(likS, c(min(x$S),max(x$S)), maximum=TRUE)$maximum

loglikS= function(theta) sum(x$S)*log(theta)+(-theta*length(x$S))-sum(log(factorial(x$S)))


hat_lambda = optimize(loglikS, c(min(x$S),max(x$S)), maximum=TRUE)$maximum

