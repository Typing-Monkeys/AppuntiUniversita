set.seed(100)
lugli = read.table("lugli.txt", header = TRUE)

I = sample(1:31, 15, replace = FALSE)
campione = lugli[I,]

#punto 1
summary(campione)
var(campione$T_15)
var(campione$T_16)

#punto 2
dato = campione$T_16
estremi = c(min(dato), quantile(dato, .25), quantile(dato, .75), max(dato))

classi = table(cut(dato, estremi, include.lowest = TRUE))
classi.hist = hist(dato, estremi, include.lowest = TRUE)

#punto 3
x = campione$T_15
y = campione$T_16

cor(x,y)^2

reg = lm(y ~ x)
summary(reg)

pred = predict(reg, data.frame(x = 33))

#punto 4
mu = mean(campione$T_15)
s = var(campione$T_15)

t.test(campione$T_15, conf.level = .90)$conf.int

if(mean(campione$T_15) < mean(lugli$T_15)){
  t.test(campione$T_15, mu = mean(lugli$T_15), alternative = "less", conf.level = .99)
} else {
  t.test(campione$T_15, mu = mean(lugli$T_15), alternative = "greater", conf.level = .99)
  
}

#punto 5
dati = campione$T_16
L_log_pois= function(theta){
  sum(dati)*log(theta)+(-theta*length(dati))-sum(log(factorial(dati))) 
}
lambda = optimize(L_log_pois, c(min(campione$T_16), max(campione$T_16)), maximum = TRUE)$maximum

Pclassi = numeric(length(estremi)-1)
  
for (i in 1:(length(estremi)-1)){
  Pclassi[i] = ppois(estremi[i+1], lambda) - ppois(estremi[i], lambda) #sostituirlo con la dist di prob che serve
}
  
Pclassi
sum(Pclassi) #se la somma non è 1 usare rescale.p = true su chisq.test

chisq.test(classi, p=Pclassi, rescale.p = TRUE)

  







