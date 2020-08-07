from graphi import Grafo
from dfs import DFS
from easy_grapho import init_grapho


def main():
    coppie = [(1, 3), (1, 2), (1, 4), (3, 7), (3, 10), (4, 5), (5, 9), (5, 8), (6, 10), (6, 8), (7, 6), (7, 2), (9, 10)]

    V, E = init_grapho(10, coppie)

    G = Grafo(V, E)

    DFS(G)

    print(G)


if __name__ == "__main__":
    main()
