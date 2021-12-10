from spooping import Spooping

def CountingSort(A, k):
    C = [0] * (k+1)

    for j in range(1, len(A)+1):
        C[A[j]] = C[A[j]] + 1

    for i in range(1, k+1):
        C[i] = C[i]+C[i-1]

    B = Spooping([0]*len(A))

    for j in range(len(A), 0, -1):
        B[C[A[j]]] = A[j]
        C[A[j]] = C[A[j]] - 1

    return(B)

