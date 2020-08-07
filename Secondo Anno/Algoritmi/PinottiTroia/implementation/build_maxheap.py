def BuildMaxHeap(A, n):
    for i in range( int(n/2), 0, -1):
        MaxHeapify(A, i, n)


def MaxHeapify(A, i, n):
    largest = A[i]
    t = i

    if((2*i <= n) and (A[i] < A[2*i])):
        t = 2*i
        largest = A[t]
    if((2*i+1 <= n) and (A[2*i+1] > largest)):
        t = 2*i+1
        largest = A[t]

    if(i != t):
        A[t], A[i] = A[i], A[t]
        MaxHeapify(A, t, n)

