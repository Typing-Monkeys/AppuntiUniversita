pm10 = c(1, 3, 0, 5, 3)
respiratorie = c(12, 4, 28, 2, 12)

f_moda = function(dati) {
  names( which(table(dati) == max(table(dati))) )
}
moda_pm10 = f_moda(pm10)
moda_resp = f_moda(respiratorie)

mediana_pm10 = median(pm10)
mediana_resp = median(respiratorie)

media_pm10 = mean(pm10)
media_resp = mean(respiratorie)

var_pm10 = var(pm10)
var_resp = var(respiratorie)

x = pm10
y = respiratorie

ab = lm(y~x)
r = cor(x,y)^2
summary(ab)

predizione = predict(ab, data.frame(x = 4))
