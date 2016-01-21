as yet unclassified
testSIRStochasticModel
	| model visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 1e5 - 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model addEquation: ('S:t=-beta*S*I').
	model addEquation: ('I:t=beta*S*I-gamma*I').
	model addEquation: ('R:t=gamma*I').
	model runStochasticSimulationFrom: 0 to: 50/365 withStep:  0.5 / 365.
	visitor := KECPPStochasticVisitor  new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 3.
	self assert: (visitor parameters size) = 2.
	