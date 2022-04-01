import tsp
import numpy as np
import matplotlib.pyplot as plt
from permutation_genetic_algorithm import permutation_genetic_algorithm

def main():
    np.random.seed(0)
    problem = tsp.tsp_problem.create_random_istance(50)
    ga = permutation_genetic_algorithm(problem, num_elem = 100, num_gen = 5000)
    a, b, improvements = ga.run()
    x = []
    y = []
    for elem in improvements:
        x.append(elem[0])
        y.append(elem[1])
    plt.plot(np.asanyarray(x, dtype=object), np.asanyarray(y, dtype=object))
    plt.show()

if __name__ == '__main__':
    main()