import numpy as np

class problem_tsp:
    def __init__(self,nc,mat):
        self.ncities=nc
        self.dmat=mat # matrix which contains all the pairwise distances

    def create_random_istance(nc):
        # creates two vectors x and y, which contain the coordinates of each city, in the range [-50,50]
        x=100*np.random.random(nc)-50
        y=100*np.random.random(nc)-50
        m=np.zeros((nc,nc))
        for i in range(nc):
            for j in range(nc):
                m[i,j]=np.sqrt((x[i]-x[j])**2+(y[i]-y[j])**2)
        return problem_tsp(nc,m)

    # l is the list of visited vertices, including the first and the last one, which are equal
    # l has lenght nc+1
    def objective_function(self,l):
        s=0
        for i in range(self.ncities):
            c1=l[i]
            c2=l[i+1]
            d=self.dmat[c1,c2]
            s=s+d
        return s

    def do_2_opt(l,i,j):
        l1=l[:i+1]
        l2=l[i+1:j]
        l3=l[j:]
        return l1+l2[::-1]+l3

    # compute the difference on the objective function if the 2-opt operation is performed
    def delta_2_opt(self,l,i,j):
        return -self.dmat[l[i],l[i+1]]-self.dmat[l[j-1],l[j]]+self.dmat[l[i],l[j-1]]+self.dmat[l[i+1],l[j]]


# local search algorithm adapted to TSP  
    def local_search(self,init_sol=None,verbose=False):
        n=self.ncities
        if init_sol is None:
            x=list(range(1,n))
            np.random.shuffle(x)
            x=[0]+x+[0]
        else:
            x=init_sol.copy()
        improved=True
        fx=self.objective_function(x)
        if verbose:
            print("initial value {}".format(fx))
        while improved:
            best_delta=1e300
            for i in range(1,n-1):
                for j in range(i+3,n):
                    delta=self.delta_2_opt(x,i,j)
                    if delta<best_delta:
                        i_best=i
                        j_best=j
                        best_delta=delta
            if best_delta<0:
                fx=fx+best_delta
                x=problem_tsp.do_2_opt(x,i_best,j_best)
                improved=True
                if verbose:
                    print("new value {}".format(fx))
            else:
                improved=False
        return x,fx


def main():
    p=problem_tsp.create_random_istance(20)
    x=list(range(20))+[0]
    p.local_search(init_sol=x,verbose=True)


if __name__ == '__main__':
    main()