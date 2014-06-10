as yet unclassified
testSIRIndividualBasedModel
	| model visitor |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 1e5 - 1.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model addEquation: (PPODEParser parse: 'S:t=-beta*S*I').
	model addEquation: (PPODEParser parse: 'I:t=beta*S*I-gamma*I').
	model addEquation: (PPODEParser parse: 'R:t=gamma*I').
	"model runIndividualBasedSimulationFrom: 0 to: 0.5  withStep:  0.0027."
	model simulator: ((KEIndividualBasedSimulator new) tMin: 0.0; tMax: 1.0; step: 0.0027; model: model; algorithm: #default).
	model simulator generateTransitionOfEvents.
	model simulator initializeListIndividuals.
	visitor := KECPPIndividualBasedVisitor  new.
	visitor visitNode: model.
	self assert: (visitor compartments size) = 3.
	self assert: (visitor parameters size) = 2.
	