Stazione= c("Gubbio - Piazza 40 Martiri","Gubbio - Ghigiano","Gubbio - Semonte Alto","Gubbio - Via L. da Vinci",
            "Gubbio - Padule", "Magione - Magione","Giano dell'Umbria - Monte Martano","Perugia - Parco Cortonese",
            "Perugia - Fontivegge","Perugia - Ponte San Giovanni","Spoleto - Piazza Vittoria",
            "Spoleto- S.to Chiodo","Spoleto - San Martino in Trignano","Spoleto - Madonna di Lugo",
            "Foligno - Porta Romana","Citta di Castello - C. Castello","Torgiano - Brufa",
            "Amelia - Amelia","Orvieto - Ciconia", "Terni - Carrara","Terni - Borgo Rivo",
            "Terni - Le Grazie","Narni - Narni Scalo")
Superamenti=c(6,4,2,2,1,4,5,3,5,7,2,6,9,4,17,6,3,2,1,15,16,29,7)

Concentrazione= c(24,15,14,20,18,22,10,22,22,25,19,21,26,21,30,26,17,22,19,31,31,38,25)

dati= data.frame(Stazione, Superamenti, Concentrazione)

val_critico = 35

S = dati$Superamenti[which(dati$Superamenti < 10)]

likS= function(theta) theta^sum(S)*exp(-theta*length(S))/prod(factorial(S))
lambda = optimize(likS, c(0, 10), maximum = TRUE)$maximum
lambda

nonins = dati$Superamenti[which(dati$Superamenti >= 10)]

p = dpois(nonins, lambda)
sum(p)
################
Y = dati$Concentrazione

estremi = c(
  min(Y),
  quantile(Y, .25),
  quantile(Y, .75),
  max(Y)
)

classi = table(cut(Y, breaks = estremi, include.lowest = TRUE))
classi

#metodo dei momenti
media = mean(Y)
stdev = sd(Y)

Pclassi = numeric(length(estremi)-1)

for (i in 1:(length(estremi)-1)){
  Pclassi[i] = pnorm(estrmi[i+1], media, stdev) - pnorm(estrmi[i], media, stdev)#sostituirlo con la dist di prob che serve
}

Pclassi
sum(Pclassi) #se la somma non è 1 usare rescale.p = true su chisq.test


#il primo elemento o è una tabella o i counts di classi
chisq.test(classi, p=Pclassi, rescale.p = TRUE)


#Punto 2
x.2 = rnorm(30, 10, sqrt(9))
x.2

t.test(x.2, conf.level = .99)$conf.int

#Punto 3

x = rbinom(100, 10, 1/3)
y = rbinom(100, 20, 2/3)

mx = 10/3
sx = numeric(length(x))
my = 40/3
sy = numeric(length(y))

for(i in 1:length(x)){
  if(x[i] <= mx){
    sx[i] = 0
  }
  else
    sx[i] = 1
  
  if(y[i] <= my){
    sy[i] = 0
  }
  else
    sy[i] = 1
}

table(sx)
table(sy)

chisq.test(sx, sy)
#pvalue: 3%, molto basso, sono statisticamente dipendenti


