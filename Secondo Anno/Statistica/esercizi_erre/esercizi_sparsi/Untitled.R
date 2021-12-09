uomini = c(
  rep("aus", 11), 
  rep("bel", 13), 
  rep("biel", 10), 
  rep("bul", 7),
  rep("fed_r", 9), 
  rep("mol", 6), 
  rep("pol", 9), 
  rep("rep_cec", 12), 
  rep("rom", 8),
  rep("slov", 13), rep("ucr", 9), rep("ung", 13), rep("olan", 13)
)

table(uomini)

donne = c(
  rep("aus", 7), 
  rep("bel", 9), 
  rep("biel", 7), 
  rep("bul", 4), 
  rep("fed_r", 6),
  rep("mol", 5), 
  rep("pol", 6), 
  rep("rep_cec", 7), 
  rep("rom", 5), 
  rep("slov", 8),
  rep("ucr", 6), 
  rep("ung", 8), 
  rep("olan", 8)
)

table(donne)

X = c("uomini", "donne")

n.uomini = sum(table(uomini))
n.donne = sum(table(donne))

p.X = c(
    n.uomini/(n.uomini+n.donne), 
    n.donne/(n.uomini+n.donne)
  )

x = sample(X, 1, prob=p.X)

Y = names(table(uomini))
p.Y = (table(uomini)+table(donne))/(n.uomini+n.donne)

y = sample(Y, 1, prob=p.Y)

NU = table(uomini)
lambda.NU = mean(NU)

LU = function(l) l^(sum(NU))*exp(-l*length(NU))/prod(factorial(NU))
optimize(LU,c(0,20), maximum=T)$maximum

ND = table(donne)
N = NU + ND

n.xy = NU[y]
n.xy
t.test(N, mu = n.xy, conf.level = .99)

tabella = as.table(cbind(NU, ND))
chisq.test(tabella)
