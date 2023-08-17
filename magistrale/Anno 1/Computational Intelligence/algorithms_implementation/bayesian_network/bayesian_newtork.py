import pgmpy
from pgmpy.models import BayesianNetwork
from pgmpy.factors.discrete import TabularCPD
from pgmpy.inference import VariableElimination
from pgmpy.inference import ApproxInference

net = BayesianNetwork([('a', 'c'), ('b', 'c')])

print(net.nodes)
print(net.edges)

pa = TabularCPD('a', 2, [[0.2], [0.8]])
pb = TabularCPD('b', 2, [[0.4], [0.6]])
pc = TabularCPD('c', 2, [[0.2, 0.3, 0.1, 0.15], [0.8, 0.7, 0.9, 0.85]], ['a', 'b'], [2, 2])
net.add_cpds(pa, pb, pc)

inference = VariableElimination(net)

rl = inference.query(variables = ['c'], evidence = {'a':0, 'b':0})
print(rl.values)

rl2 = inference.query(variables = ['c'], evidence = {'a':0})
print(rl2.values)

rl3 = inference.query(variables = ['c'])
print(rl3.values)

inference2 = ApproxInference(net)
rl_2 = inference2.query(variables=['c'])
print(rl_2.values)