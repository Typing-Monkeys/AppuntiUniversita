import numpy as np
from graphi import Vertice
from graphi import Arco


def init_grapho(size, coppie):
    V = [Vertice(x + 1) for x in range(size)]
    E = np.full((len(V), len(V)), None)

    for elem in coppie:
        E[elem[1] - 1][elem[0] - 1] = Arco(V[elem[0] - 1], V[elem[1] - 1])

    return (V, E)
