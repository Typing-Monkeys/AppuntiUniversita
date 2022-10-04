from TSP import Tsp_problem
import numpy as np

class ACO_for_TSP:
    def __init__(self,problem):
        self.problem=problem
        self.alpha=1
        self.beta=1
        self.rho=0.1
        self.tau0=0.5
        self.n_ants=20
        self.w_ib=self.rho*2/3
        self.w_bs=self.rho*1/3
        self.n_cities=problem.get_dim()

    def initialize(self):
        self.phero=np.ones((self.n_cities+1,self.n_cities))*self.tau0
        self.best_so_far=None
        self.bs_cost=1e300 # very large value
        self.sol=[None]*self.n_ants
        self.sol_cost=np.zeros(self.n_ants)

    def run(self,num_gen,seed=0):
        if seed!=0:
            np.random.seed(seed)
        self.initialize()
        for g in range(1,num_gen+1):
            for n in range(0,self.n_ants):
                self.sol[n]=self.generate_solution()
            self.evaluate_solutions(g)
            self.update_pheromone()
        return self.best_so_far, self.bs_cost


    def generate_solution(self):
        sol=[]
        rem=list(range(self.n_cities))
        current=self.n_cities # a non existing city, it means that it must choose the first city to visit
        for i in range(self.n_cities):
            city=self.select_city(current,rem)
            sol.append(city)
            current=city
            rem.remove(city)
        return sol


    def select_city(self,current,rem):
        nr=len(rem)
        prob=np.zeros(nr)
        for i in range(0,nr):
            city=rem[i]
            tau=self.phero[current,city]
            eta=1 if current==self.n_cities else 1/self.problem.dist_matrix[current,city]
            p=tau**self.alpha * eta**self.beta
            prob[i]=p
        den=sum(prob)
        prob=prob/den
        # roulette wheel method
        r=np.random.random()
        i=0
        while r>prob[i]:
            r=r-prob[i]
            i=i+1
        return rem[i]

    def evaporate(self):
        self.phero=(1-self.rho)*self.phero

    def evaluate_solutions(self,g):
        for i in range(0,self.n_ants):
            self.sol_cost[i]=self.problem.objective_function(self.sol[i])
        self.ibest=self.sol_cost.argmin()
        if self.sol_cost[self.ibest]<self.bs_cost:
            self.bs_cost=self.sol_cost[self.ibest]
            self.best_so_far=self.sol[self.ibest]
            print("new best {} at gen. {}".format(self.bs_cost,g))

    def update_pheromone(self):
        self.evaporate()
        #self.reward(self.best_so_far, self.w_bs/self.bbs_cost)
        #self.reward(self.sol[self.ibest], self.w_ib/self.sol_cost[self.ibest])
        self.reward(self.best_so_far, self.w_bs)
        self.reward(self.sol[self.ibest],self.w_ib)

    def reward(self,sol,delta):
        current=self.n_cities
        for i in range(self.n_cities):
            city=sol[i]
            self.phero[current,city] += delta
            current=city