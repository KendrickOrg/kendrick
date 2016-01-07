examples
modelRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression
	"self new exampleRK4SolverOnSIRSimpleModel"
	| model |
	model := KEModel new population: (KEPopulation size: 100000).
	model attributes: {#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999 atOthersPut: 0.
	model atCompartment: { #status->#I } put: 1.
	model addParameters: {#beta->0.0052. #gamma->52}.
	model addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: 'beta*I' parseAsAnExpression.
	model addTransitionFrom: '{#status: #I}'
		to: '{#status: #R}'
		probability: 'gamma' parseAsAnExpression.
	^ model