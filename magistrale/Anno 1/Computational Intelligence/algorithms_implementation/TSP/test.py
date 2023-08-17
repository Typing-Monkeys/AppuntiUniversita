from TSP import * 
p = Problem_tsp.create_random_instance(50)
print(p.ncities)
print(p.dmat)

l = list(range(0, 50))
l.append(0)
print(len(l))

print(p.objective_function(l))

l1 = Problem_tsp.do_2_opt(l, 22, 44)
print(p.objective_function(l1))

delta = p.delta_2_opt(l, 22, 44)
print(delta)
print(p.objective_function(l)+delta)

p = Problem_tsp.create_random_instance(20)
print(p.local_search(verbose=True))
