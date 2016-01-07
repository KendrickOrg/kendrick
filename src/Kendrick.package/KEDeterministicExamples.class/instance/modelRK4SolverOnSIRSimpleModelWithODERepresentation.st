examples
modelRK4SolverOnSIRSimpleModelWithODERepresentation
	"self new exampleRK4SolverOnSIRSimpleModelWithODERepresentation"

	| model |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.
		
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addEquation: 'S:t=-beta*S*I' parseAsAnEquation.
	model addEquation: 'I:t=beta*S*I - gamma*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I' parseAsAnEquation.
	^ model