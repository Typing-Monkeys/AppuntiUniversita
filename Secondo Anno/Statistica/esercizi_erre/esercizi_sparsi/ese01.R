varianza_classi = function(dati, estremi) {
  fi = table(cut(dati,estremi))/length(dati)
  Fi = cumsum(fi)
  
  #hist serve per aver accesso a xi e ni -> numero di elementi per ogni classe
  hist_numeri = hist(dati, breaks = estremi, plot = FALSE) 
  
  ni = hist_numeri$counts #numero elementi di ogni classe
  xi = hist_numeri$mids   #media tra estremo sup e inf di ogni classe
  
  media = sum(xi*fi)
  varianza = sum( ((xi-media)^2) * ni) / (length(dati) - 1 )
  
  return(varianza)
}

dati = c(0.6, 1, 1.8, 2.6, 3, 3, 3.4, 3.6, 4, 4, 4, 4, 4.4, 4.6, 5, 5, 5.4, 5.6, 6, 7)
estremi_classi = c(0.5,2.5,3.5,4.5,5.5,7.5)

varianza = varianza_classi(dati, estremi_classi)

cat("Varianza: ", varianza)
