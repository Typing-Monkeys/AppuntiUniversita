import numpy as np
from ls import local_search

def iterated_local_search(prob,num_tries,num_flips,init_sol=None):
    n=prob.get_dim()
    if init_sol is None:
        n=np.random.randint(0,1+1,n)
    else:
        x=init_sol.copy()
    nt=0
    fx=prob.objective_function(x)
    while nt<num_tries:
        y=perturbation(x,num_flips)
        z,fz=local_search(prob,y)
        if fz<fx:
            x=z
            fx=fz
            nt=0
        else:
            nt+=1
    return x,fx

def perturbation(x,num_flips):
    n=len(x)
    y=x.copy()
    for flip in range(num_flips):
        i=np.random.randint(0,n)
        y[i]=1-y[i]
    return y
