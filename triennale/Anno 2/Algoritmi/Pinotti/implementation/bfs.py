from graphi import Grafo
from graphi import Vertice


class Queue:
    def __init__(self):
        self.Q = []

    def enqueue(self, s):
        self.Q.append(s)

    def dequeue(self):
        tmp = self.Q[0]
        del self.Q[0]
        return tmp

    def size(self):
        return len(self.Q)


def BFS(G: Grafo, s: Vertice):
    s.color = "grey"
    s.d = 0
    s.pi = None
    Q = Queue
    Q.enqueue(s)
    while Q.size() != 0:
        u = Q.dequeue()
        for v in G.adj(u):
            if v.color == "white":
                v.color = "grey"
                v.d = u.d + 1
                v.pi = u
                Q.enqueue(v)
        u.color = "black"


def main():
    Q = Queue()
    Q.enqueue(1)
    Q.enqueue(2)
    Q.enqueue(3)
    print(Q.size())


if __name__ == "__main__":
    main()
