tests
testCalculateDerivation
	| model solverRK dydx j listOfEquations |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 1e5 - 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	self assert: (model atParameter: #beta) equals: 0.0052.
	self assert: (model atParameter: #gamma) equals: 365 / 7.
	model addEquation: (PPODEParser parse: 'S:t=-beta*S*I').
	model addEquation: (PPODEParser parse: 'I:t=beta*S*I-gamma*I').
	model addEquation: (PPODEParser parse: 'R:t=gamma*I').
	solverRK := RungeKuttaSolver new.
	solverRK getListOfEquationsOf: model.
	dydx := solverRK calculateDerivation: model.
	self assert: dydx size equals: 3