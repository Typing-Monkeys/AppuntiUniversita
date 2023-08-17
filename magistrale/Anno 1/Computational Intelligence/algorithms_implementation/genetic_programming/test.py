from gp import *

t = genetic_programming.tree.generate(3)
print(t.height())

print(t.evaluate(np.array([3,4,1,2])))

