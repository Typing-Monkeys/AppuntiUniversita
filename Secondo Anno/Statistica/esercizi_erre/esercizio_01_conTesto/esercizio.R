dati = read.table("dati", sep = ",", header = TRUE)

moda <- function(x) {
  names(which(table(x) == max(table(x))))
}

moda_pm10 = moda(dati$n..centraline.superamento.limite.PM10)
mediana_pm10 = median(sort(dati$n..centraline.superamento.limite.PM10))
media_pm10 = mean(dati$n..centraline.superamento.limite.PM10)
varianza_pm10 = var(dati$n..centraline.superamento.limite.PM10)

moda_ricoveri = moda(dati$n..ricoveri.per.difficolta.resipatorie)
mediana_ricoveri = median(sort(dati$n..ricoveri.per.difficolta.resipatorie))
media_ricoveri = mean(dati$n..ricoveri.per.difficolta.resipatorie)
varianza_ricoveri = var(dati$n..ricoveri.per.difficolta.resipatorie)

X = dati$n..centraline.superamento.limite.PM10
Y = dati$n..ricoveri.per.difficolta.resipatorie

correlazione = cor(X,Y)^2
regressione = lm(Y~X)

plot(X,Y, main = "Scala Lineare")

a = as.numeric(regressione$coefficients[2])
b = as.numeric(regressione$coefficients[1])

abline(regressione)

predizione = predict(regressione, data.frame(X = 4))

points(4, predizione, col="red")

#SCALA LOGARITMICA
Y_log = log(Y)

log_correlazione = cor(X, Y_log)^2

regressione_log = lm(Y_log~X)

plot(X, Y_log, main = "Scala Logaritmica", ylab = "log(Y)")
abline(regressione_log)

predizione_log = predict(regressione_log, data.frame(X = 4))
points(4, predizione_log, col = "red")

#STAMPA FINALE
cat("Coefficienti regressione lineare:\n")
cat("a = ", a,"\t b = ", b,"\n")
cat("\nConfronto scala LINEARE con LOGARITMICA\n\n")
cat("Correlazione:\n")
cat("Lineare: ", correlazione,"\n")
cat("Logaritmica: ", log_correlazione,"\n\n")

cat("Predizione:\n")
cat("Lineare: ", predizione,"\n")
cat("Logaritmica: ", predizione_log, "( exp: ", exp(predizione_log), ")\n\n")