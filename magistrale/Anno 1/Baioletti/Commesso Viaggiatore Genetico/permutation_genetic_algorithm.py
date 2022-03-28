# a simple genetic algorithm for unconstrained permutation minimization problems

import numpy as np

class permutation_genetic_algorithm:

    def __init__(self, problem, num_elem = None, num_gen = 100, pcross = 0.9, pmut = 0.01):
        self.problem = problem
        self.num_nodes = problem.get_dim()
        if num_elem is None:
            self.num_elem = self.num_nodes
        else:
            self.num_elem = num_elem
        self.pcross = pcross
        self.pmut = pmut
        self.num_gen = num_gen

    def run(self):
        self.init_population()
        for gen in range(0, self.num_gen):
            mating_pool = self.select_mating_pool()
            children = self.do_crossover(mating_pool)
            self.do_mutations(children)
            self.select_new_population(children)
        return self.best, self.best_f

    def init_population(self):
        self.population=[]
        self.f_obj = np.zeros(self.num_elem)
        self.best = None
        self.best_f = 1e300
        for i in range(0, self.num_elem):
            l = list(range(0,self.num_nodes))
            ind = np.random.shuffle(l)
            self.population.append(ind)
            self.f_obj[i] = self.problem.objective_function(ind)
            self.update_best(ind, self.f_obj[i])

    def update_best(self, x, fx):
        if fx > self.best_f:
            self.best_f = fx
            self.best = x
            print(f"New best: {fx}")

    def select_mating_pool(self):
        mating_pool = []
        self.fitness = np.array([1/f for f in self.f_obj])
        for i in range(0, self.num_elem//2):
            p1 = self.roulette_wheel()
            p2 = self.roulette_wheel()
            mating_pool.append((p1,p2))
        return mating_pool

    def roulette_wheel(self):
        s = np.sum(self.fitness)
        r = np.random.random()*s
        i = 0
        while r > s:
            r = r - self.fitness[i]
            i = i + 1
        return self.population[i]

    def do_crossover(self, mating_pool):
        children = []
        for p1, p2 in mating_pool:
            if np.random.random() < self.pcross:
                c1, c2 = self.crossover_operator(p1, p2)
            else:
                c1 = p1.copy()
                c2 = p2.copy()
            children.append(c1)
            children.append(c2)
        return children
    
    def crossover_operator(self, p1, p2):
        ok = False
        while not ok:
            i1 = np.random.randint(1, self.num_nodes-1)
            i2 = np.random.randint(1, self.num_nodes-1)
            if i1 != i2:
                ok = True
        j1 = min(i1, i2)
        j2 = max(i1, i2)
        c1 = self.ordered_crossover(p1, p2, j1, j2)
        c2 = self.ordered_crossover(p2, p1, j1, j2)
        return c1, c2

    def ordered_crossover(p1, p2, j1, j2):
        n = len(p1)
        c = [None]*n
        for j in range(j1, j2+1):
            c[j] = p1[j]
        h = 0
        for j in range(n):
            if p2[j] not in c:
                assert(c[h] == None)
                c[h] = p2[j]
                h += 1
                if h == j1:
                    h = j2+1
        return c

    def do_mutations(self, children):
        # da implementare col proff
        for c in children:
            if np.random.random() < self.pmut:
                pass

    def select_new_population(self, children):
        l = self.population + children
        fc = [self.problem.objective_function(c) for c in children]
        f = list(self.f_obj) + fc
        l1 = list(range(2*self.num_elem))
        l1.sort(key=lambda i: f[i])
        l1best = l1[:self.num_elem]
        self.population = [l[i] for i in l1best]
        self.f_obj = [f[i] for i in l1best]
        self.update_best(self.population[0], self.f_obj[0])
