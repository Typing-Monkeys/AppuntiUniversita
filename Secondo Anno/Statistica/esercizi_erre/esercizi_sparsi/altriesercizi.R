n1 = sample(300:350, 1)
n2 = sample(650:700, 1)

e = rep(-0.15, n1)
f = rep(-0.1, n2)
g = rep(0.1, n2)
h = rep(0.15, n1)

R = c(e, f, g, h)
r = sample(R, 200, replace = TRUE)

v = sample(-1000:0, 200, replace = FALSE) * 10^-3
w = (v+r)^2

w.classi = hist(w, breaks = "FD", plot = FALSE)
w.classi_n = names(table(cut(w, w.classi$breaks)))

moda = w.classi_n[which(w.classi$density == max(w.classi$density))]

fi = w.classi$counts / sum(w.classi$counts)
Fi = cumsum(fi)

media = sum(w.classi$mids*fi)
mediana = quantile(w.classi$mids, 2/4)

varianza = sum(w.classi$counts * (w.classi$mids - media)^2) / length(w)-1


#c2.w = min(which(Fi >1/2))

#w.classi$breaks[c2.w] + (1/2 - Fi[c2.w -1])/ w.classi$density[c2.w]