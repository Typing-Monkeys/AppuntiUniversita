x = c(-10:10)
k = sample(c(3,5,7), 1)
prob = c(1/20, 2/20, 3/20, 8/20, 3/20, 2/20, 1/20)
z = sample(c(-3:3), 21, replace = TRUE, prob = prob)

w = x^k
y = w+z

f_moda = function(dati) {
  names( which((dati$counts) == max((dati$counts))))
}

estremi = c( min(w[1], y[1]), quantile(w, 1/4), mean(w), quantile(w, 3/4), max(w[21], y[21]) )

classi = hist(w, breaks = estremi, plot = FALSE)
classi_nomi = names(table(cut(w, estremi)))

moda = classi_nomi[which(classi$density == max(classi$density))]
mediana = classi$mids[2]
q1 = classi$mids[1]
q2 = classi$mids[2]

fi = classi$counts/sum(classi$counts)
Fi = cumsum(fi)

media = sum(classi$mids*fi)

varianza = sum(classi$counts * (classi$mids-media)^2)/length(w)-1

classi.y = hist(y, breaks = estremi, plot = FALSE)
classi_nomi.y = names(table(cut(y,estremi)))

r = cor(w,y)^2
ab = lm(y~w)

previsione = predict(ab, data.frame(w = k))