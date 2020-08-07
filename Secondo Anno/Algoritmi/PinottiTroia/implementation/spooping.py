class Spooping(list):
    def __init__(self, *args):
        list.__init__(self, *args)
        self.n = len(self)

    def __getitem__(self, key):
        if key == 0 or key > len(self):
            raise IndexError('Spooping index out of range')
        else:
            if key < 0:  # puo ricevere -1 ecc
                return list.__getitem__(self, key)
            else:
                return list.__getitem__(self, key-1)

    def __setitem__(self, key, val):
        self.__getitem__(key)
        list.__setitem__(self, key-1, val)

    