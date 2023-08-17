from permutation_genetic_algorithm import *
import matplotlib.pyplot as plt
from TSP import *

# Test per vedere come funziona il crossover
'''
p1 = [0,2,3,5,1,6,4]
p2 = [2,5,1,4,3,0,6]

j1 = 2
j2 = 4

print(Permutation_genetic_algorithm.ordered_crossover(p1, p2, j1 , j2))

print(Permutation_genetic_algorithm.ordered_crossover(p2, p1, j1 , j2))
'''

# Test effettivo
p = Tsp_problem.create_random_instance(50)
print(p.n_cities)
print(p.dist_matrix) # La matrice ha 0 sulla diagonale perchè ogni elemento ha distanza zero con se stesso

ga = Permutation_genetic_algorithm(p, 100, num_gen=5000)

x, fx, c = ga.run()

gen = [x[0] for x in c]
fobj = [x[1] for x in c]

plt.plot(gen, fobj)
plt.show()

# Info sulle singole run
'''
ris = [ga.run() for i in range(10)]

ff = [x[1] for x in ris]

print(np.mean(ff))

print(min(ff))

print(np.std(ff))
'''
