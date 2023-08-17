# a simple genetic algorithm for unconstrained permutation minimization problems

import numpy as np

class Permutation_genetic_algorithm:

	def __init__(self, problem, num_elem=None, num_gen=100, pcross=0.9, pmut=0.01):
		self.problem=problem
		self.num_nodes=problem.get_dim()
		if num_elem is None:
			self.num_elem=self.num_nodes
		else:
			self.num_elem=num_elem
		self.pcross=pcross
		self.pmut=pmut
		self.num_gen=num_gen

	def run(self):
		self.improvements=[]
		self.init_population()
		for gen in range(1,self.num_gen+1):
			mating_pool=self.select_mating_pool()
			children=self.do_crossover(mating_pool)
			self.do_mutation(children)
			#self.select_new_population_best(children,gen)
			self.select_new_population_elit(children,gen)
		return self.best, self.best_f, self.improvements

	def init_population(self):
		self.population=[]
		self.f_obj=np.zeros(self.num_elem)
		self.best=None
		self.best_f=1e300 # very large number
		for i in range(0,self.num_elem):
			ind=list(range(0,self.num_nodes))
			np.random.shuffle(ind)
			self.population.append(ind)
			self.f_obj[i]=self.problem.objective_function(ind)
			self.update_best(ind,self.f_obj[i],0)
		
	def update_best(self, x, fx, g):
		if fx<self.best_f:
			self.best_f=fx
			self.best=x
			print("new best ",fx," at gen. ",g)
			self.improvements.append((g,fx))
	
	def select_mating_pool(self):
		mating_pool=[]
		self.fitness=np.array([1/f for f in self.f_obj])
		for i in range(0,self.num_elem//2):
			p1=self.roulette_wheel()
			p2=self.roulette_wheel()
			mating_pool.append((p1,p2))
		return mating_pool

	def roulette_wheel(self):
		s=np.sum(self.fitness)
		r=np.random.random()*s
		i=0
		while r>s:
			r=r-self.fitness[i]
			i=i+1
		return self.population[i]

	def do_crossover(self, mating_pool):
		children=[]
		for p1, p2 in mating_pool:
			if np.random.random()<self.pcross:
				c1, c2 = self.crossover_operator(p1,p2)
			else:
				c1=p1.copy()
				c2=p2.copy()
			children.append(c1)
			children.append(c2)
		return children

	def crossover_operator(self, p1, p2):
		ok=False
		while not ok:
			i1=np.random.randint(1,self.num_nodes-1)
			i2=np.random.randint(1,self.num_nodes-1)
			if i1!=i2:
				ok=True
		j1=min(i1,i2)
		j2=max(i1,i2)
		c1=Permutation_genetic_algorithm.ordered_crossover(p1,p2,j1,j2)
		c2=Permutation_genetic_algorithm.ordered_crossover(p2,p1,j1,j2)
		return c1,c2

	def ordered_crossover(p1,p2,j1,j2):
		n=len(p1)
		c=[None]*n
		for j in range(j1,j2+1):
			c[j]=p1[j]
		h=0
		for j in range(n):
			if p2[j] not in c:
				assert(c[h]==None)
				c[h]=p2[j]
				h+=1
				if h==j1:
					h=j2+1
		return c

	def do_mutation(self,children):
		for c in children:
			if np.random.random()<self.pmut:
				Permutation_genetic_algorithm.perform_exchanges(c,1)

	def perform_exchanges(c,ns):
		for i in range(ns):
			ok=False			
			while not ok:
				i1=np.random.randint(1,len(c)-1)
				i2=np.random.randint(1,len(c)-1)
				if i1!=i2:
					ok=True
			c[i1],c[i2]=c[i2],c[i1]
					
	def select_new_population_best(self,children,g):
		l=self.population+children
		fc=[self.problem.objective_function(c) for c in children]
		f=list(self.f_obj)+fc
		l1=list(range(2*self.num_elem))
		l1.sort(key=lambda i: f[i])
		l1best=l1[:self.num_elem]
		self.population=[l[i] for i in l1best]
		self.f_obj=[f[i] for i in l1best]
		self.update_best(self.population[0],self.f_obj[0],g)
		
	def select_new_population_elit(self,children,g):
		'''
        Ricapitolando:
            Ho messo insieme i padri (self.population) e i figli.
            Ho calcolato la funzione obiettivo per ogni figlio.
            Ho messo insieme, in un'unica lista, le funzioni obiettivo dei padri (che già avevo) e dei figli.
            Ho creato una lista che contiene gli indici di tutti (sia padre che figli):
                - i padri hanno un indice che va da 0 a num_elem-1
                - i figli da num_elem in poi
            Ho ordinato questa lista di indici in base al valore della funzione f.
            Ho preso la prima parte di questi indici.
            Ho ricostruito la nuova popolazione prendendo i valori di l soltanto per indici migliori e i valori di f.
            Infine ho chiamato la funzione update_best.
            Questo meccanismo in generale si potrebbe usare come select new population anche per i problemi binari.
        '''
		# find the best among the children and the parents
		f_child=np.array([self.problem.objective_function(c) for c in children])
		ib1=np.argmin(self.f_obj)
		ib2=np.argmin(f_child)
		# first case: the best child is better than the the best parent
		if f_child[ib2]<self.f_obj[ib1]:
			self.population=children
			self.f_obj=f_child
			self.update_best(children[ib2],f_child[ib2],g)
		else:
			iw=np.argmax(f_child)
			children[iw]=self.population[ib1]
			f_child[iw]=self.f_obj[ib1]
			self.population=children
			self.f_obj=f_child
		
