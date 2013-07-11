as yet unclassified
testSEIRModelWithLossOfImmunityStochasticModel
	| model visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #sigma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #to put: 2.
	model atParameter: #N put: 100000.
	model addEquation: (PPODEParser parse: 'S:t=mu*N-beta*S*I-mu*S+to*R').
	model addEquation: (PPODEParser parse: 'E:t=beta*S*I-sigma*E-mu*E').
	model addEquation: (PPODEParser parse: 'I:t=sigma*E-gamma*I-mu*I').
	model addEquation: (PPODEParser parse: 'R:t=gamma*I-mu*R-to*R').
	model simulator: ((KEStochasticSimulator new) tMin: 0.0; tMax: 1.0; step: 0.001; model: model; algorithm: #GillespieDirect).
	model generateEvents.
	visitor := KECPPStochasticVisitor  new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 4.
	self assert: (visitor parameters size) = 6.
	