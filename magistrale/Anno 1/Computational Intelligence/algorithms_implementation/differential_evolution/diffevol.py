# Una semplice implementazione dell'algoritmo Differential Evolution
import numpy as np

class Objective_Function:
    def __init__(self, fun, dim, domains):
        '''
        - fun è la definzione della funzione
        - dim è il numero di parametri
        - domains è la lista degli intervalli [x_i_min, x_i_max] per ogni variabile x_i
        '''
        self.fun = fun
        self.dim = dim
        self.domains = domains

    def __call__(self, x):
        return self.fun(x) 


class Differential_Evolution:
    def __init__(self, objf, np, f, cr, max_gen):
        self.objf = objf
        self.np = np
        self.f = f
        self.cr = cr
        self.max_gen = max_gen

    def initialize(self): # Serve ad inizializzare l'algoritmo (Ad esempio è necessario creare i vettori della popolazione)
        d = self.objf.dim
        self.population = []
        self.values = []
        for i in range(self.np):
            r = np.random.random(d)
            for j in range(d):
                l, u = self.objf.domains[j] # intervallo della j-esima variabile della funzione
                r[j] = l + (u - l) * r[j]
            self.population.append(r)
            self.values.append(self.objf(r))
        self.best_f = 1e300
        self.find_best()

    def find_best(self):# trovo il miglior elemento della popolazione
        self.i_best = 0
        for i in range(1, self.np): 
            if self.values[i] < self.values[self.i_best]:
                self.i_best = i
        if self.values[self.i_best] < self.best_f:
            self.best_f = self.values[self.i_best]
            self.best = self.population[self.i_best]
            print("found new best with f = {}".format(self.best_f))

    def evolution(self):
        self.initialize()
        for g in range(1, self.max_gen+1):
            mutants = self.differential_mutation()
            trials = self.crossover(mutants) # gli elementi prodotti dal crossover nel differential evolution si chiamano trials
            self.selection(trials)
            self.find_best()
        return self.best_f, self.best

    def differential_mutation(self):
        mutants = []
        for i in range(self.np):
            # RAND/1 implementations
            l = [j for j in range(self.np) if j != i]
            r1, r2, r3 = np.random.choice(l, 3, replace=False)
            m = self.population[r1] + self.f * (self.population[r2] -  self.population[r3])
            mutants.append(m)
        return mutants

    def crossover(self, mutants):
        trials = []
        d =  self.objf.dim
        for i in range(self.np):
            j_rand = np.random.randint(0, d)
            tr = np.zeros(d)
            for j in range(d):
                if np.random.random() < self.cr or j == j_rand:
                    tr[j] = mutants[i][j]
                else:
                    tr[j] = self.population[i][j]
            trials.append(tr)
        return trials

    def selection(self, trials):
        for i in range(self.np):
            fx = self.objf(trials[i])
            if fx < self.values[i]:
                self.population[i] = trials[i]
                self.values[i] = fx