from graphi import Grafo
from graphi import Vertice


time = 0


def DFS(G: Grafo):
    for v in G.V:
        if v.color == "white":
            DFS_visit(G, v)


def DFS_visit(G: Grafo, u: Vertice):
    global time

    time += 1
    u.d = time
    u.color = "grey"

    for v in G.adj(u.key):
        if v.color == "white":
            v.pi = u

            G.E[v.key - 1][u.key - 1].type = "t"

            DFS_visit(G, v)

        elif v.color == "grey":
            G.E[v.key - 1][u.key - 1].type = "b"

        elif v.color == "black":
            if u.d < v.d:
                G.E[v.key - 1][u.key - 1].type = "f"
            elif u.d > v.d:
                G.E[v.key - 1][u.key - 1].type = "c"

    u.color = "black"
    time += 1
    u.f = time
