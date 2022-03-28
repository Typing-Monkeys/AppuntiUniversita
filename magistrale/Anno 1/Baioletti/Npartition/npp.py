import numpy as np


class problem:

    def __init__(self, num):
        self.dim = num
        self.numbers = np.random.random_integers(1, 100000, num)

    def objective_function(self, sol):
        s = 0
        for i in range(self.dim):
            if sol[i] == 0:
                s += self.numbers[i]
            else:
                s -= self.numbers[i]
        return np.abs(s)

    def get_dim(self):
        return self.dim