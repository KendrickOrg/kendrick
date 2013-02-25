tests
testRungeKutta

| model solverRK dydx j listOfEquations nbIterations result |
model := KEModel new.
model atCompartment:#S putNumberOfIndividuals: 99999.
model atCompartment:#I putNumberOfIndividuals: 1.
model atCompartment:#R putNumberOfIndividuals: 0.
model atParameter:#beta put: 0.0052.
model atParameter: #gamma put: 365/7.

model addEquation: (PPODEParser parse:'S:t=-beta*S*I').
model addEquation: (PPODEParser parse: 'I:t=beta*S*I-gamma*I').
model addEquation: (PPODEParser parse: 'R:t=gamma*I').

solverRK := RungeKuttaSolver new.
solverRK finalValueOfX: 1.0.
solverRK initialValueOfX: 0.0.
solverRK stepSize: 0.001.

nbIterations := ((1.0 - 0.0) / 0.001) rounded.
self assert: (solverRK nbOfIterations ) equals: nbIterations.

result := solverRK solver: model.
self assert: ((result atIndex: #S) size) equals: nbIterations




