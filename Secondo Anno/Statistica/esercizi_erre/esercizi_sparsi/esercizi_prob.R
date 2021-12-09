# F(x) per binomiale

curve(pbinom(x, size = 10, prob= .5), -1, 11, axes=FALSE)
axis(1, 0:10)
axis(2)
curve(pbinom(x, size = 10, prob= .3), -1, 11, col="red", add=TRUE)

curve(pbinom(x, size = 10, prob= .75), -1, 11, col="blue", add=TRUE)

curve(pbinom(x, size = 5, prob= .9), -1, 11, col="purple", add=TRUE)


# Problema 1

# L'1% dei siti di un certo habitat risulta inquinato. 
# Ispezionanandone 20, con che probabilita' non più di 2 
# risulteranno inquinati ?

n = 20
p= .01

pbinom(2, size=n, prob = p) # P(X <= 2)

# E con che probabilita' invece almeno 1 risultera' inquinato

1 - pbinom(0, n, p) # P(X >= 1)
pbinom(0, n, p, lower.tail = FALSE)

# Fino a quanti se ne troveranno inquinati nel 95% dei campionamenti di questo tipo?

qbinom(.95, n, p) # Quantile associato a q=0.95

# Distribuzione ipergeometrica

# Problema 2
# Se in un lotto di 80 confezioni ce ne fossero 30 fallati,
# con che probabilita' se ne troverebbe uno fallato 
# prelevandone 10 senza reimmissione ?

N = 80
h = 30
n = 10

dhyper(1, m = h, n= N-h, k=n) #P(X=1)

# E quella che non ce ne siano più di due ?

phyper(2, m = h, n= N-h, k=n) #P(X <= 2)

# .... e piu' di 5 ?

1- phyper(5, m = h, n= N-h, k=n) #P(X > 5)

phyper(5, m = h, n= N-h, k=n, lower.tail = FALSE) #idem

# visaulizzazione funzione di massa di probabilita'

plot(0:n, dhyper(0:n, m = h, n= N-h, k=n), type = "h", axes=FALSE)
axis(1, 0:n)
axis(2)


# visualizzazione funzione di ripartizione

curve(phyper(x, m = h, n= N-h, k=n), -1, 11)


# Distribuzione geometrica e BinomialeNegativa

# Problema 3
# Un farmaco causa effetti collaterali nel 0,1% dei malati che lo assumono.
# In una sperimentazione si somministra il farmaco in sequenza a dei pazienti.

# Con che probabilita' il primo effetto collaterale si osserva al decimo paziente

p =.001

dgeom(9, prob = p) # P(X=9)

# e con che probabilita' si presentera' prima di 100 somministrazioni

pgeom(100, prob=p)

# e almeno due nei primi 200

pnbinom(198, size = 2, prob = p)


# Dist di Poisson

# Problema 4
# In una citta' il mumero medio di giornate invernali in cui si supera limite di PM10 
# è di 5.07.

# Con che probabilita' in una stagione ci saranno 10 giornate di inquinamento ?

l = 5.07

dpois(10, lambda = l) #P(X=10)

# E con che probabilita' le si supereranno ?

1 - ppois(10, l) # P(X > 10)

ppois(10, l, lower.tail = FALSE) # idem

# Fino a quante giornate il limite viene superato nel 95% delle stagioni ?

qpois(.95, lambda = l)

# ... e nel 99%...

qpois(.99, lambda = l)


# visualizzazione funzione massa di probabilita'

plot(0:13, dpois(0:13, lambda= l), type="h", axes=FALSE)
axis(1, 0:13)
axis(2)

# funzione di ripartizione

curve(ppois(x, lambda=l), -1, 13)
abline(h=1, col="red")

# visualizzazione dist. esponenziale

curve(dexp(x, rate=1), 0, 4, ylim=c(0,5))
curve(dexp(x, rate=2), 0, 4, col="red", add= TRUE)
curve(dexp(x, rate=3), 0, 4, col="purple", add= TRUE)
curve(dexp(x, rate=4.7), 0, 4, col="blue", add= TRUE)

curve(pexp(x, rate=1), 0, 4, ylim=c(0,1))
curve(pexp(x, rate=2), 0, 4, col="red", add= TRUE)
curve(pexp(x, rate=3), 0, 4, col="purple", add= TRUE)
curve(pexp(x, rate=4.7), 0, 4, col="blue", add= TRUE)

# Problema 5
# Raffiche di vento d'intensita' superiore a quella sopportabile
# si verificano in media una volta ogni 3 anni.
# Qual'e' la probabilita' che una tale raffica si verifichi entro i prossimi 8 MESI ?


# T = "tempo occorrenza raffica non sopportabile" ~ exp(lambda)

previsione = 3 # media

lambda = 1/previsione

pexp(8/12, rate = lambda) # P(T < 8 mesi)


# E quella che non si verifichi nei prossimi 5 anni ?

1 - pexp(5, lambda) # P(T > 5 anni)

pexp(5, lambda, lower.tail = FALSE) # idem

# Entro quanto tempo ci sarà una tale raffica al 95% di probabilita' ?

qexp(.95, rate = lambda)

# Quale periodo ha solo l'1% di probabilita' di non registrare tali raffiche ?

qexp(.01, rate = lambda, lower.tail = FALSE)



# dist normale

# standard

# densita'
curve(dnorm(x), -3.5, 3.5, ylim=c(0,1))

# ripartizione (cumulata)

curve(pnorm(x), -3.5, 3.5, col="red", add= TRUE)


# confronto distribuzioni con media e varianza diverse

curve(dnorm(x), -11, 11, ylim=c(0,2/(sqrt(2*pi))))
curve(dnorm(x, mean = 2, sd= 3), -11, 11, col = "red", add= TRUE)
curve(dnorm(x, mean = -5, sd= 1/2), -11, 11, col = "blue", add= TRUE)


# Problema 6
# Diametro di un perno prodotto in serie e' un n.a. X
# con dist. Normale  di parametri mu = 12.5 mm e dev.st = 0.02 mm.

# Sono ritenuti conformi i perni con diamtre tra i 12.46 e 12.54 mm.

# Che percentuale di "scarto ha la produzione ?

mu = 12.5
sigma = .02

1 - (pnorm(12.54, mu, sigma) - pnorm(12.46, mu, sigma))# 1  - P(12.46<X<12.54)
(1 - (pnorm(12.54, mu, sigma) - pnorm(12.46, mu, sigma)))*100 # in percentuale

# Con che probabilita' viene prodotto un perno "conforme" di diametro minore di 12.52 ?

pnorm(12.52, mu, sigma) - pnorm(12.46, mu, sigma)

# Che diametro hanno il 5%  inferiore della produzione "conforme" ?

qinf = pnorm(12.46, mu, sigma) # per capire che quantile sia il limite inferiore dei conformi

qnorm(qinf+.05, mu, sigma)

# Distribuzioni Beta

# densita'

curve(dbeta(x, shape1 = 2 , shape2= .1))
curve(dbeta(x, shape1 = .3 , shape2= 1.2), col ="red", add= TRUE)
curve(dbeta(x, shape1 = 3 , shape2= 4), col ="blue", add= TRUE)
curve(dbeta(x, shape1 = .3 , shape2= .1), col ="green", add= TRUE)
curve(dbeta(x, shape1 = 1 , shape2= 1), col ="purple", lty=2, lwd = 2,  add= TRUE)

# cumulate
curve(pbeta(x, shape1 = 2 , shape2= .1), -0.1, 1.1)
curve(pbeta(x, shape1 = .3 , shape2= 1.2), -0.1, 1.1, col ="red", add= TRUE)
curve(pbeta(x, shape1 = 3 , shape2= 4), -0.1, 1.1, col ="blue", add= TRUE)
curve(pbeta(x, shape1 = .3 , shape2= .1), -0.1, 1.1, col ="green", add= TRUE)
curve(pbeta(x, shape1 = 1 , shape2= 1), -0.1, 1.1, col ="purple", lty=2, lwd = 2,  add= TRUE)

# Problema 7 

# La percentuale di gradimento di un film in una generica citta'
# ha distribuzione Beta(10, 7), con che probabilita' a Perugia non superera' il 50% ?

# visualizzazione densita' (tanto per rendersi conto della "forma" della distribuzione)

curve(dbeta(x, 10 , 7))

pbeta(.5, 10, 7) # P(X < 50%)

# Qual'e' invece la percentuale "mediana" ?

qbeta(.5, 10, 7)
