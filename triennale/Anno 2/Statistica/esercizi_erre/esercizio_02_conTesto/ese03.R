dati = read.table("dati", header = TRUE)

y = dati$T_15
x = dati$T_12

correlazione_lineare = cor(x,y)^2

plot(x,y)
abline(lm(y~x))

#scala logaritmica

y_log = log(y)

correlazione_logaritmica = cor(x,y_log)^2

plot(x,y_log)
abline(lm(y_log~x))

#scala esponenziale
y_exp = exp(y)

correlazione_esponenziale = cor(x,y_exp)^2