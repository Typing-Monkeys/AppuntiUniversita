#an instance is given by the numver oif the nodes (0, ..., num_nodes-1)
#and by the list of the edges (pairs of nodes)

import numpy as np

class maxcut_problem:

    def __init__(self, num_nodes, edges):
        self.num_nodes = num_nodes
        self.edges = edges

    def create_random_istances(num_nodes, edge_prob):
        edges = []
        for i in range(0 , num_nodes):
            for j in range(i + 1, num_nodes):
                if np.random.random() < edge_prob:
                    edges.append((i,j))
        return maxcut_problem(num_nodes, edges)

    def objective_function(self, c):
        # c is a num_nodes binary string
        num_cuts = 0
        for x, y in self.edges:
            if c[x] != c[y]:
                num_cuts += 1
        return num_cuts

    def get_dim(self):
        return self.num_nodes