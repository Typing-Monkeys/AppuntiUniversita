# a simple genetic algorithm for unconstrained binay maximization problems

import numpy as np

class binay_genetic_algorithm:

    def __init__(self, problem, num_elem = None, num_gen = 100, pcross = 0.9, pmut = 0.01):
        self.problem = problem
        self.num_bits = problem.get_dim()
        if num_elem is None:
            self.num_elem = self.num_bits
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
        self.best_f = -1
        for i in range(0, self.num_elem):
            ind = np.random.randint(0,1+1,self.num_bits)
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
        for i in range(0, self.num_elem//2):
            p1 = self.roulette_wheel()
            p2 = self.roulette_wheel()
            mating_pool.append((p1,p2))
            #mating_pool.append(p1)
            #mating_pool.append(p2)
        return mating_pool

    def roulette_wheel(self):
        s = np.sum(self.f_obj)
        r = np.random.random()*s
        i = 0
        while r > s:
            r = r - self.f_obj[i]
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
        # one point crossover
        l1 = list(p1)
        l2 = list(p2)
        j = np.random.randint(1, self.num_bits)
        c1 = np.array(l1[:j] + l2[j:])
        c2 = np.array(l2[:j] + l1[j:])
        return c1, c2

    def do_mutations(self, children):
        for c in children:
            for i in range(0, self.num_bits):
                if np.random.random()<self.pmut:
                    c[i] = 1 - c[i]

    def select_new_population(self, children):
        # survival of the fittest
        # find the best among the children and the parents
        f_child = np.array([self.problem.objective_function(c) for c in children])
        ib1 = np.argmax(self.f_obj)
        ib2 = np.argmax(f_child)
        # first case: the best child is better than the best parent
        if f_child[ib2] > self.f_obj[ib1]:
            self.population = children
            self.f_obj = f_child
            self.update_best(children[ib2], f_child[ib2])
        else:
            iw = np.argmin(f_child)
            children[iw] = self.population[ib1]
            f_child[iw] = self.f_obj[ib1]
            self.population = children
            self.f_obj = f_child
