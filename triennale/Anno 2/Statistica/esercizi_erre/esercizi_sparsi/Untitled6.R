set.seed(420)
totale = read.table("inquinamento.txt", header = TRUE)

indici = sample(1:1000, 31, replace = FALSE)

campione = totale[indici,]

summary(campione$pesci)
var(campione$plastica)

estremi = c(4, 9, 12, 18)
classi.plastica = table(cut(campione$plastica, breaks = estremi, include.lowest = TRUE))

#plastica dist NORMALE
#pesci dist POISSON

mu0.plastica = mean(campione$plastica)
s2.plastica = var(campione$plastica)

lambda.pesci = mean(campione$pesci)


f = quantile(totale$plastica, .95)

1 - pnorm(f, mu0.plastica, sqrt(s2.plastica))

f2 = quantile(totale$pesci, .05)


ppois(f2, lambda.pesci) - dpois(f2, lambda.pesci)

#####
Pclassi = numeric(length(estremi)-1)
  
for (i in 1:(length(estremi)-1)){
  Pclassi[i] = pnorm(estremi[i+1], mu0.plastica, sqrt(s2.plastica)) - pnorm(estremi[i], mu0.plastica, sqrt(s2.plastica)) #sostituirlo con la dist di prob che serve
}
  
Pclassi
sum(Pclassi) #se la somma non è 1 usare rescale.p = true su chisq.test
  
  
  #il primo elemento o è una tabella o i counts di classi
chisq.test(classi.plastica, p=Pclassi, rescale.p = TRUE)
####

chisq.test(campione$pesci, campione$plastica)
#####
dati = campione$pesci
n = length(dati)
s02 = 4.19
free = .99
# VALORE ASSUNTO DALLA STATISTICA TEST
v.assunto = (n-1) * var(dati)/s02
  
# VALORE CRITICO
v.critico = qchisq(free, df= n-1)
  
  #se v.assunto < v.critico NON si rifiuta H0
  
  #p-value
pchisq(v.assunto, df = n-1, lower.tail = FALSE)

###
x = campione$plastica
y = campione$pesci

cor(x,y)^2

reg = lm(y ~ x)
summary(reg)

pred = predict(reg, data.frame(x = 15))
pred
#7

rate = 5/60

