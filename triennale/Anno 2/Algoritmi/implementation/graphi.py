class Vertice:
    def __init__(self, key: int):
        self.d = 0
        self.f = 0
        self.pi = None
        self.color = "white"
        self.key = key

    def __repr__(self):
        return str(self.key)


class Arco:
    def __init__(self, i: Vertice, f: Vertice):
        self.type = ""
        self.i = i
        self.f = f

    def __repr__(self):
        return str(self.i)+","+str(self.f)


class Grafo:
    def __init__(self, vertici: list, archi: list):
        self.V = vertici
        self.E = archi

    def adj(self, u):
        result = []
        u -= 1
        for i in range(len(self.V)):
            elem = self.E[i][u]

            if elem is not None:
                result.append(elem.f)

        return result

    def __repr__(self):
        str_ = ""

        for i in range(len(self.V)):
            for j in range(len(self.V)):
                if self.E[i][j] is None:
                    str_ += " -\t"
                else:
                    elem = self.E[i][j]
                    str_ += " " + elem.type + "\t"
            str_ += "\n"

        return str_
