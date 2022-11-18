def Partition(A, p, r):
    pivot = A[r]
    i = p - 1

    for j in range(p, r):
        if A[j] <= pivot:
            i += 1
            A[i], A[j] = A[j], A[i]

    i += 1
    A[r], A[i] = A[i], A[r]

    return i


def QuickSort(A, p, r):
    if r > p:
        q = Partition(A, p, r)
        QuickSort(A, p, q-1)
        QuickSort(A, q+1, r)

