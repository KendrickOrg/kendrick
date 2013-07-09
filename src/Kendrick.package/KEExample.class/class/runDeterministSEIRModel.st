as yet unclassified
runDeterministSEIRModel
	"self runDeterministSEIRModel"

	| model |
	model := KEModel new.
	model atCompartment: #S putNumberOfIndividuals: 99999.
	model atCompartment: #E putNumberOfIndividuals: 0.
	model atCompartment: #I putNumberOfIndividuals: 1.
	model atCompartment: #R putNumberOfIndividuals: 0.
	model atParameter: #beta put: 0.0052.
	model atParameter: #gamma put: 365 / 7.
	model atParameter: #sigma put: 365 / 7.
	model atParameter: #mu put: 1 / 80.
	model atParameter: #N put: 100000.
	model addEquation: (PPODEParser parse: 'S:t=mu*N-beta*S*I-mu*S').
	model addEquation: (PPODEParser parse: 'E:t=beta*S*I-sigma*E-mu*E').
	model addEquation: (PPODEParser parse: 'I:t=sigma*E-gamma*I-mu*I').
	model addEquation: (PPODEParser parse: 'R:t=gamma*I-mu*R').
	model runDeterministSimulationFrom: 0.0 to: 1.0 withStep: 0.001.
	model plot: { #S . #I . #R . #E }