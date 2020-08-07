from sys import maxsize as infinity # massimo numero intero rappresentabile

def MergeSort(A, p, r):
    if p < r:
        q = int( (p+r)/2 )
        MergeSort(A, p, q)
        MergeSort(A, q+1, r)
        Merge(A, p, q, r)


def Merge(A, p, q, r):
    n1 = q - p + 1
    n2 = (r - p + 1) - n1

    L = [0] * (n1 + 1)
    for i in range(n1):
        L[i] = A[p+i]
    L[n1] = infinity

    R = [0] * (n2 + 1)
    for i in range(n2):
        R[i] = A[q+i+1]
    R[n2] = infinity

    i = 0
    j = 0

    for k in range(p, r+1):
        if L[i] < R[j]:
            A[k] = L[i]
            i += 1
        else:
            A[k] = R[j]
            j += 1

