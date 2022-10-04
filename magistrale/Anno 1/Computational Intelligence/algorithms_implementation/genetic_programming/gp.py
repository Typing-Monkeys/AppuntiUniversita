from asyncio import constants
from statistics import variance
from tkinter import Variable
import numpy as np

class genetic_programming:
    nv = 4
    constant_list = [-1, -2, 0, 1, 2]
    operator_list = ['+', '-', '*', '/']

    class tree:
        def __init__(self, root):
            self.root = root
        
        def evaluate(self, env):
            # env is a np.array which contains the values of the variables
            # each variables has a zero-based index
            return self.root.evaluate(env)
        
        def __str__(self):
            return str(self.root)
        
        def recursive_generate(depth):
            if depth == 1:  # create a leaf node
                if np.random.random() < 0.5:
                    ix = np.random.randint(0, genetic_programming.nv-1)
                    return genetic_programming.variable(ix)
                else:
                    k = np.random.choice(genetic_programming.constant_list)
                    return genetic_programming.constant(k)
            
            # else create an internal node
            op = np.random.choice(genetic_programming.operator_list)
            ch1 = genetic_programming.tree.recursive_ggenerate(depth-1)
            ch2 = genetic_programming.tree.recursive_ggenerate(depth-1)
            return genetic_programming.internal_node(op, ch1, ch2)
        
        def generate(depth):
            return genetic_programming.tree(genetic_programming.tree.recursive_generate(depth))

        def recursive_copy(node):
            if isinstance(node, genetic_programming.variable):  # create a leaf node
                return genetic_programming.variable(node.var_index)
            elif isinstance(node, genetic_programming.constant):
                return genetic_programming.constant(node.value)
            
            # else create an internal node
            op = node.op
            ch1 = genetic_programming.tree.recursive_copy(node.child1)
            ch2 = genetic_programming.tree.recursive_copy(node.child2)
            return genetic_programming.internal_node(op, ch1, ch2)
        
        def copy(self):
            c = genetic_programming.tree.recursive_copy(self.root)
            return genetic_programming.tree(c)

        def choose_node(self):
            # return a list where 1 means first child and 2 means second child
            h = self.height()
            d = np.random.randint(0, h-1)
            result = []
            node = self.root
            for i in range(0, d):
                c = np.random.choice([1,2])
                if c == 1:
                    result.append(1)
                    node = node.child1
                else:
                    result.append(2)
                    node = node.child2
            return result

        def height(self):
            return self.root.height()

        def subtree(self, path):
            node = self.root
            while path!=[]:
                j = path[0]
                node = node.child1 if j == 1 else node.child2
                path = path[1:]
            return node
        
        def replace(self, path, subt):
            if path == []:
                self.root = subt
                return
            path2 = path[:-1]
            last = path[-1]
            node = self.root
            while path2!=[]:
                j = path2[0]
                node = node.child1 if j == 1 else node.child2
                path2 = path2[1:]
            if last == 1:
                node.child1 = subt
            else:
                node.child2 = subt
            return node
        

    class internal_node(tree):
        def __init__(self, op, ch1, ch2=None):
            self.op = op
            self.child1 = ch1
            self.child2 = ch2
        
        def evaluate(self,env):
            v1 = self.child1.evaluate(env)
            v2 = self.child2.evaluate(env) if self.child2 else null
            if self.op == '+':
                return v1+v2
            if self.op == '-':
                return v1-v2
            if self.op == '*':
                return v1*v2
            if self.op == '/':      # il diviso va protetto perchè v2 potrebbe essere 0
                return v1/v2 if v2!=0 else v1
            
        def __str__(self):
            # TODO funziona solo se op è binario
            return "({0} {1} {2})".format(str(self.child1), self.op, str(self.child2))
        
        def height(self):
            h1 = self.child1.height()
            h2 = self.child2.height()
            return 1 + max(h1, h2)

        
    class variable:
        def __init__(self, ix):
            self.var_index = ix
        
        def evaluate(self, env):
            if self.var_index < len(env):
                return env[self.var_index]
            raise Exception("Invalid index {0}".format(self.var_index))

        def __str__(self):
            return "X{}".format(self.var_index)

        def height(self):
            return 1

    class constant:
        def __init__(self, k):
            self.value = k
        
        def evaluate(self,env):
            return self.value

        def __str__(self):
            return "X{}".format(self.value)
        
        def height(self):
            return 1
    

    def crossover(t1, t2):
        p1 = t1.choose_node()
        p2 = t2.choose_node()
        st1 = t1.subtree(p1)
        st2 = t2.subtree(p2)
        c1 = t1.copy()
        c2 = t2.copy()
        c1.replace(p1, st2)
        c2.replace(p2, st1)
        return c1. c2
    
    def mutation(t):
        p = t.choose_node()
        st = genetic_programming.tree.generate(len(p)+1)
        t.repalce(p, st)
    

    def __init__(self, problem, num_elem=None, num_gen=100, pcross=0.9, pmut=0.01):
		self.problem=problem
		self.num_bits=problem.get_dim()
		if num_elem is None:
			self.num_elem=self.num_bits
		else:
			self.num_elem=num_elem
		self.pcross=pcross
		self.pmut=pmut
		self.num_gen=num_gen

	def run(self):
		self.init_population()
		for gen in range(0,self.num_gen):
			mating_pool=self.select_mating_pool()
			children=self.do_crossover(mating_pool)
			self.do_mutation(children)
			self.select_new_population(children)
		return self.best, self.best_f

	def init_population(self):
		self.population=[]
		self.f_obj=np.zeros(self.num_elem)
		self.best=None
		self.best_f=-1
		for i in range(0,self.num_elem):
			ind=np.random.randint(0,1+1,self.num_bits)
			self.population.append(ind)
			self.f_obj[i]=self.problem.objective_function(ind)
			self.update_best(ind,self.f_obj[i])
		
	def update_best(self, x, fx):
		if fx>self.best_f:
			self.best_f=fx
			self.best=x
			print("new best ",fx)

    def select_mating_pool(self):
		mating_pool=[]
		for i in range(0,self.num_elem//2):
			p1=self.roulette_wheel()
			p2=self.roulette_wheel()
			mating_pool.append((p1,p2))
		return mating_pool

	def roulette_wheel(self):
		s=np.sum(self.f_obj)
		r=np.random.random()*s
		i=0
		while r>s:
			r=r-self.f_obj[i]
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

    def do_mutation(self,children):
            for c in children:
                for i in range(0, self.num_bits):
                    if np.random.random()<self.pmut:
                        c[i]=1-c[i]

	def select_new_population(self,children):
		# Find the best among the children and the parents
		f_child=np.array([self.problem.objective_function(c) for c in children])
		ib1=np.argmax(self.f_obj)
		ib2=np.argmax(f_child)
		# First case: the best child is better than the the best parent
		if f_child[ib2]>self.f_obj[ib1]:
			self.population=children
			self.f_obj=f_child
			self.update_best(children[ib2],f_child[ib2])
		else:
			iw=np.argmin(f_child)
			children[iw]=self.population[ib1]
			f_child[iw]=self.f_obj[ib1]
			self.population=children
			self.f_obj=f_child
