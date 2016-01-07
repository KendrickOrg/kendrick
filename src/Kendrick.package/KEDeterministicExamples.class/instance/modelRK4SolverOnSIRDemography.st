examples
modelRK4SolverOnSIRDemography
	"self new exampleRK4SolverOnSIRDemographyModel"
	| model |
	model := KEModel new population: (KEPopulation size: 5000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: '{#status: #S}' put: 4975.
	model atCompartment: '{#status: #I}' put: 25.
	model atCompartment: '{#status: #R}' put: 0.
	model addParameter: #beta value: 1 / 5000.
	model addParameter: #gamma value: 1 / 10.0.
	model addParameter: #mu value: 5e-4.
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: 'I:t=beta*S*I-gamma*I-mu*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I-mu*R' parseAsAnEquation.
	^ model