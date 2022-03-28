import maxcut

from binary_genetic_algorithm import binay_genetic_algorithm


def main():
    problem = maxcut.maxcut_problem.create_random_istances(20, 0.1)
    algoritmo = binay_genetic_algorithm(problem, num_elem=20)
    print(algoritmo.run())


if __name__ == '__main__':
    main()