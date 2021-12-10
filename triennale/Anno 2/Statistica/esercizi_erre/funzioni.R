#Funzioni per metodo di Massima Verosomiglianza (optimize)
#Poisson
#se la prima da worning in optimize usare la seconda
L_pois = function(theta){
  theta^sum(dati)*exp(-theta*length(dati))/prod(factorial(dati))
}
L_log_pois= function(theta){
  sum(dati)*log(theta)+(-theta*length(dati))-sum(log(factorial(dati))) 
}
#optimize(L_pois, c(min(dati), max(dati)), ...)

#Bernulliana (binomiale)
L_bern = function(theta){
  theta^sum(dati)*(1-theta)^(length(dati)-sum(dati))
}

L_log_bern = function(theta){
  log(L_bern(theta))
}
#optimize(L_bern, c(0,1), ...)

#Normale (?)
#theta1 = media
#theta2 = sd ( sqrt(varianza))
L_norm = function(theta1, theta2, dati) (1/(sqrt(2*pi)*theta2))^length(dati)*exp(-(1/2)*sum(((dati-theta1)/theta2)^2))

#Esponenziale
#logaritmica
L_log_exp = function(lambda) {
  n <- length(dati)
  sumx <- sum(dati)
  n*log(lambda) - lambda*sumx
} 

L_exp = function(lambda){
  exp(L_log_exp(lambda))
}
#optimize(L_exp, c(min(dati), max(dati)), ...)

#Uniforme
#è il massimo dei dati --> max(dati)


#------------------------------------------------------------#


#usare quando chiede:
#testare l'ipotesi, con significatività' dell' 1%, che i valori della distribuzione in classi del punto c) provengano da
#una distribuzione ++distribuzione che chiede++

#per la significatività basta guardare il pvalue del chisq.test, se è minore di quello chiesto allora va bene
#function(estremi){
  Pclassi = numeric(length(estremi)-1)
  
  for (i in 1:(length(estremi)-1)){
     Pclassi[i] = pchisq(estremi[i+1], df=480) - pchisq(estremi[i], df=480) #sostituirlo con la dist di prob che serve
  }
  
  Pclassi
  sum(Pclassi) #se la somma non è 1 usare rescale.p = true su chisq.test
  
  
  #il primo elemento o è una tabella o i counts di classi
  chisq.test(h$counts, p=Pclassi)
#}


#Test sulla VARIANZA
#function(){
  
  n = length(dati)
  s02 = #numero di sigma^2
  
  alpha = #significatività ( numero piccolo ) [ se test >= passare a numero grande es .95]
  
  #se ipotesi >=
  # VALORE ASSUNTO DALLA STATISTICA TEST
  v.assunto = (n-1) * var(dati)/s02
  
  # VALORE CRITICO
  v.critico = qchisq(alpha, df= n-1)
  
  #se v.assunto < v.critico NON si rifiuta H0
  
  #p-value
  #pchisq(v.assunto, df = n-1, lower.tail = FALSE)
  
  
  #se ipotesi DIVERSO
  v.critico1=qchisq(alpha/2, df=n-1)
  #t1
  
  v.critico2=qchisq(1-alpha/2, df=n-1)
  #t2
  
  # se v.assunto > v.critico2 oppure v.assunto < v.critico1 si rifiuta H0
  # e quindi si accetta H1 che la varianza sia effettivamente diversa
  
  
#}

#test di indipenenza di due variabili
#chisq.test(table(var1, var2))
