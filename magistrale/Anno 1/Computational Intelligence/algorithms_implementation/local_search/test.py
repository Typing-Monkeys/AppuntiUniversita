np.random.seed(42)

# ------------------------------------------------------------------------------------------------
# BEST IMPROVEMENT
from local_search_bi import *

p = Problem(100)

print(p.numbers)
print(p.get_dim())


x, fx = local_search(p)
#print(x, fx)

x, fx = local_search(p,x) # si vede che ritorna sempre lo stesso valore e quindi non migliora


risultati = [local_search(p) for run in range(100)]
#print(risultati)

ff = [coppia[1] for coppia in risultati]

min = np.min(ff)
print(min)

np.mean(ff)
np.max(ff)
np.min(ff)
np.median(ff)


# ------------------------------------------------------------------------------------------------
# FIRST IMPROVEMENT
from local_search_fi import *
p = Problem(100)
x, fx = local_search(p)
#print(x, fx)

risultati = [local_search(p) for run in range(100)]


ff = [coppia[1] for coppia in risultati]
min = np.min(ff)
print(min)


# -------------------------------------------------------
# ILS
from iterated_local_search import *
p = Problem(100)

x,fx = iterated_local_search(p, 10, 5)

print(fx)

s0 = [p.numbers[i] for i in range(100) if x[i] == 0]
print(sum(s0))

s1 = [p.numbers[i] for i in range(100) if x[i] == 1]
print(sum(s1))

print(sum(s1)-sum(s0))


ris_ls = [local_search(p) for _ in range(100)]
print(ris_ls)