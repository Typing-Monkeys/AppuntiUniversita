# PRELIMINARI

lugli=read.table("lugli.txt", header = T)

I = sample(1:31, size = 15, replace = F)


campione = lugli[I, ]

# PUNTO 1

summary(campione)
attach(campione)

table(T_15)
table(T_16)

moda = function(x) labels(which(table(x)==max(table(x))))
moda(T_15)
moda(T_16)

var(T_15)
var(T_16)

# PUNTO 2


c0 = min(T_16)
c1 = quantile(T_16, 1/4)
c2 = quantile(T_16, 3/4)
c3 = max(T_16)

estremi=c(c0, c1, c2, c3)
 h = hist(T_16, breaks = estremi,  plot = F)
h

media.classi = sum(h$mids*h$counts/length(T_16))
media.classi

F = cumsum(h$counts/length(T_16))
F
 
 i_1 = min(which(F >= 1/4))
 i_1
 Q1 = estremi[i_1]+(1/4)/h$density[i_1]
 Q1

 i_3 = min(which(F >= 3/4))
 i_3
 Q3 = estremi[i_3]+(3/4-F[i_3-1])/h$density[i_3]
 Q3

i_m = min(which(F >= 1/2))
i_m
 mediana = estremi[i_m]+(1/2- F[i_m -1])/h$density[i_m]
 mediana

varianza.classi = sum((h$mids - media.classi)^2*h$counts/(length(T_16)-1))
varianza.classi

# PUNTO 3

modlin = lm(T_16 ~ T_15)
summary(modlin)

predict(modlin, data.frame(T_15 = 33))

# PUNTO 4

mu0 = mean(lugli$T_15)
mu0
mean(campione$T_15)

intconf = t.test(campione$T_15, mu=mu0, conf.level = .9)$conf.int
intconf

if(mean(campione$T_15) < mu0)  t.test(campione$T_15, mu=mu0, conf.level = .99, alternative =  "less") else  t.test(campione$T_15, mu=mu0, conf.level = .99, alternative =  "greater")

## in base al p-value si trae conclusione se rifiutare (quando p-value < alpha) o meno  (quando p-value > alpha) l'ipotesi nulla H0
           
# PUNTO 5

logL = function(l) -length(campione$T_16)*l + sum(campione$T_16)*log(l) - sum(log(factorial(campione$T_16)))
lambda.hat = optimize(logL, c(0, max(campione$T_16)), maximum = T)$maximum
lambda.hat
mean(campione$T_16)

probabilita = numeric(length(estremi)-1)
for (i in 1:length(probabilita))
    probabilita[i] = ppois(estremi[i+1], lambda = lambda.hat) -  ppois(estremi[i], lambda = lambda.hat)

probabilita
sum(probabilita)

chisq.test(h$counts, p=probabilita, rescale.p = T)

# conclusione in base a p-value (se minore di alpha si rifiuta ipotesi adattamento se no si accetta)