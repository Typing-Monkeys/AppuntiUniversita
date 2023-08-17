from binary_genetic_algorithm import *
from maxcut import *

p = Maxcut_problem.create_random_instance(20, 0.1)
g = Binary_genetic_algorithm(p, num_elem=20)
g.run()
print(len(p.edges))


p2 = Maxcut_problem.create_random_instance(40, 0.2)
print(len(p2.edges))
g = Binary_genetic_algorithm(p2, num_elem=20)
g.run()
