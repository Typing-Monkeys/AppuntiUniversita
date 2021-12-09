dati = read.table("dati.txt", header = TRUE)
attach(dati)
dati $Y
is(dati)
is(Y)
table(X)
table(X)/length(X)
freq_rel = table(Y)/length(Y)
cumsum(freq_rel)
table(W)
table(cut(W, breaks = c(40, 50, 58, 70, 95)))
number = hist(W)
number

