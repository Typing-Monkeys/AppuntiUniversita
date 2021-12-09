x = c(-10:10)
k = sample(c(3,5,7), 1)
p = c( 1/20, 2/20, 3/20, 8/20, 3/20, 2/20, 1/20 )
z = sample(-3:3, 21, replace = TRUE, prob = p)
w = x^k
y = w + z

plot(w,y)
correlazione = cor(y,w)^2