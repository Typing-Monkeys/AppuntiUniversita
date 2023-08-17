from diffevol import *

'''
objf = Objective_Function(lambda x: np.sqrt(x[0]**2+x[1]**2), 2, [[-1,1], [-1,1]])
print(objf(np.array([1,1])))
a = Differential_Evolution(objf, 20, 0.9, 1, 100)
a.evolution()
'''

# Provando ad allargare il dominio tra -10 e 10
objf = Objective_Function(lambda x: np.sqrt(x[0]**2+x[1]**2), 2, [[-10,10], [-10,10]])
objf(np.array([1,1]))
a = Differential_Evolution(objf, 20, 0.9, 1, 100)
a.evolution()

# è possibile giocare con i parametri in vari modi
objf = Objective_Function(lambda x: np.sqrt(np.dot(x,x)), 10, [[-10,10] for i in range(10)])
a = Differential_Evolution(objf, 50, 0.9, 0.5, 1000)
a.evolution()
