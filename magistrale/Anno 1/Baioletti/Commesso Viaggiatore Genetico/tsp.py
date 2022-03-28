
import numpy as np

class tsp_problem:

    def __init__(self, n_cities, dist_matrix):
        self.n_cities = n_cities
        self.dist_matrix = dist_matrix

    def create_random_istance(n):
        # non funziona così random
        x = np.random.random(-5, 5, size = n)
        y = np.random.random(-5, 5, size = n)
        m = np.zeros((n,n))
        for i in range(n):
            for j in range(n):
                m[i,j] = np.sqrt((x[i]-x[j])**2+(y[i]-y[j])**2)
        return tsp_problem(n,m)

    def objective_function(self, x):
        # x is the ordered list of the visited nodes, except the last
        # 1 2 0 4 5 3
        cost = 0
        for i in range(0, self.n_cities - 1):
            c1 = x[i]
            c2 = x[i+1]
            cost += self.dist_matrix[c1, c2]
        # cost to come back to the first node
        c1 = [-1]
        c2 = [0]
        cost += self.dist_matrix[c1, c2]
        return cost

    def det_dim(self):
        return self.n_cities