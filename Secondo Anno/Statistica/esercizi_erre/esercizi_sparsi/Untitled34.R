set.seed(420)
dati = c(22.3, 24.1, 22.9, 24.0, 23.8, 23.2, 24.9, 22.6, 23.3, 20.9, 24.0, 20.3, 25.7, 24.0, 25.1, 25.1, 25.7, 24.9, 24.6, 24.2, 22.7, 22.0, 23.2, 22.0, 20.9, 21.6, 19.9, 23.2, 22.3, 22.7)

mean(dati)
var(dati)

t.test(dati, mu = 22.7, alternative = "greater")

n = length(dati)
s02 = 2
# VALORE ASSUNTO DALLA STATISTICA TEST
v.assunto = (n-1) * var(dati)/s02

# VALORE CRITICO
v.critico = qchisq(0.95, df= n-1)

#se v.assunto < v.critico NON si rifiuta H0

#p-value
#pchisq(w, df = n-1, lower.tail = FALSE)
