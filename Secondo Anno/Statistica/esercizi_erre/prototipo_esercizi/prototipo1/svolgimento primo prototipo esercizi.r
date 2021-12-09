#SVOLGIMENTO PROTOTIPO DOMANDE

totale=read.table("inquinamento.txt",header=TRUE)
INDICECAMPIONE=sample(1:1000,31)
campione=totale[INDICECAMPIONE,]

# 1

# calcolo indici pesci

Q1P = quantile(campione$pesci, 1/4)

Q1P # I quartile

Q3P = quantile(campione$pesci, 3/4)

Q3P # III quartile

MEDP = median(campione$pesci)

MEDP # mediana

muP = mean(campione$pesci)
muP # media aritmetica

vP = var(campione$pesci)
vP # varianza campionaria corretta

# calcolo indici plastica con dist. in classi

estremi = c(4, 9, 12, 18)

hPLAST = hist(campione$plastica, breaks = estremi, include.lowest = TRUE)

fi = hPLAST$counts/length(campione$plastica)

Fi = cumsum(fi)

i1 = min(which(Fi >= 1/4))
i1 # indice classe entro cui cade I quartile

if (i1 == 1)  {Q1PLAST = estremi[i1] + 0.25/hPLAST$density[i1]} else {Q1PLAST = estremi[i1] + (0.25-Fi[i1-1])/hPLAST$density[i1]}

Q1PLAST # I quartile


i3 = min(which(Fi >= 3/4))
i3 # indice classe entro cui cade III quartile

if (i3 == 1)  {Q3PLAST = estremi[i3] + 0.75/hPLAST$density[i3]} else {Q3PLAST = estremi[i3] + (0.75-Fi[i3-1])/hPLAST$density[i3]}

Q3PLAST # III quartile

i2 = min(which(Fi >= 1/2))
i2 # indice classe entro cui cade la mediana

if (i2 == 1)  {medPLAST = estremi[i2] + 0.5/hPLAST$density[i2]} else {medPLAST = estremi[i2] + (0.5-Fi[i2-1])/hPLAST$density[i2]}

medPLAST # mediana

muPLAST =sum(hPLAST$mids*hPLAST$counts)/length(campione$plastica)
muPLAST # media aritmetica

vPLAST =sum((hPLAST$mids-muPLAST)^2*hPLAST$counts)/(length(campione$plastica) - 1)
vPLAST # varianza campionaria corretta


#2 

lamda=mean(campione$pesci) # stima parametro Poisson
m=mean(campione$plastica) # stima previsione Normale
s=sd(campione$plastica) # stima dev.standard Normale

q1=quantile(totale$pesci,0.05)
p1=ppois(q1,lamda)-dpois(q1,lamda) # P(X < q1)
as.vector(p1) # visualizza p senza etichetta associata al quantile q1

q2=quantile(totale$plastica,0.95)
p2=pnorm(q2,m,s, lower.tail = FALSE) # P( Y > q2)
as.vector(p2)

#3 

probabilita=numeric(length(estremi)-1)
probabilita


for(i in 1:length(probabilita)) probabilita[i]=pnorm(estremi[i+1],m,s)-pnorm(estremi[i],m,s)
probabilita # probabilità di un n.a. con distribuzione normale di avere valori nella classi del punto 1

sum(probabilita) # per verificare se sommino o meno a 1

chisq.test(hPLAST$counts,p=probabilita,rescale.p=TRUE)

# se p-value < alpha (NOTA: nel testo non era specificato il valore di alpha, usare default 0.05) 

# 4 
chisq.test(table(campione$plastica,campione$pesci)) # test chi-quadro d'indipendenza

# se p-value < alpha ri rifiuta H0 quindi NON c'è indipendenza (altrimenti l'opposto)

# 5 
alpha=0.01
S_02=4.19 # valore ipotizzato in H0
n=length(campione$pesci)                                                                          

t=(n-1)*var(campione$pesci)/S_02 # valore assunto dalla statistica test con i dati campionari
t

# dato che l'ipotesi alternativa è che la varianza sia "diversa" da 4.19 (test bidirezionale)
# i valori critici sono due: il quantile di livello alpha/2 e quello di livello 1-alpha/2

t1=qchisq(alpha/2, df=n-1)
t1

t2=qchisq(1-alpha/2, df=n-1)
t2

# se t > t2 oppure t < t1 si rifiuta H0
# e quindi si accetta H1 che la varianza sia effettivamente diversa


# 6

x = campione$plastica
y = campione$pesci

linmod = lm(y~x) # modello lineare semplice

predict(linmod, data.frame(x=15)) # numero di pesci morti previsti

summary(linmod)

# se il valore dell'indici di bontà d'adattamento R-squared è > 0.8 il modello è buono, alrimenti no

# 7
# si devono utilizzare distribuzioni di Poisson

tm = 5 #tasso medio accessi per minuto

l1 = tm*3 # parametro per n.a. accessi in 3 minuti

dpois(15, l1) # P(X1 = 15)

l2 = tm*30 # parametro per n.a. accessi in mezz'ora

ppois(100, l2) # P(X2 <= 100)

l3 = tm*60 # parametro per n.a. accessi in un'ora

qpois(.95, l3) # quantile di livello .95

#(risposte a domande teoriche e motivazione)

# 8 F: perché è l'opposto, lindice è vicino a zero se c'è indipendenza tra le coppie

# 9 F: R^2 può assumere valori in [0,1] e vale 1 in caso di perfetta dipendenza lineare (positiva o negativa)

# 10 F: un evento possibile può avere tranquillamente probabilità 0 (si pensi ad esempio a tutti gli eventi del tipo (X=x) con X n.a. continuo e x valore nel suo codominio) 

# 11 F: è l'opposto, un campione si definisce significativo quando porta a RIFIUTARE H0

# 12 V: lo stimatore è una funzione dei n.a. componenti del campione casuale, mentre la stima è il valore che assume una volta calcolato con i dati campionari

