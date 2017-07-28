as yet unclassified
testSEIRWithLossOfImunityIndividualBasedModel
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
	model addEquation: ('S:t=mu*N-beta*S*I-mu*S+to*R').
	model addEquation: ('E:t=beta*S*I-sigma*E-mu*E').
	model addEquation: ('I:t=sigma*E-gamma*I-mu*I').
	model addEquation: ('R:t=gamma*I-mu*R-to*R').
	"model runIndividualBasedSimulationFrom: 0 to: 0.5  withStep:  0.0027."
	model simulator: ((KEIndividualBasedSimulator new) tMin: 0.0; tMax: 1.0; step: 0.0027; model: model; algorithm: #default).
	model simulator generateTransitionOfEvents.
	model simulator initializeListIndividuals.
	visitor := KECPPIndividualBasedVisitor  new.
	visitor visitNode: model.
	self assert: (visitor compartments size) =4.
	self assert: (visitor parameters size) = 6.
	