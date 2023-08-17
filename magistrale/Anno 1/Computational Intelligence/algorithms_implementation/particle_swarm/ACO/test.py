from ACO import *

pr = Tsp_problem.read_file("algorithms_implementation/particle_swarm/ACO/berlin52.tsp")

a = ACO_for_TSP(pr)

print(a.alpha)

a.run(500, 121)


