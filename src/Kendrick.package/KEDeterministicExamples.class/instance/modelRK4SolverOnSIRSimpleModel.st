examples
modelRK4SolverOnSIRSimpleModel
	"self new exampleRK4SolverOnSIRSimpleModel"

	| model |
	model := KEModel new.
	model population: (KEPopulation size: 100000).
	model attributes: 
		{#status->#(#S #I #R)}.
	model atCompartment: { #status->#S } put: 99999.
	model atCompartment: { #status->#I } put: 1.
	model atCompartment: { #status->#R } put: 0.
	model addParameters: {#beta->0.0052. #gamma->52}.
	model
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :m | 
			(m atParameter: #beta) * 
			(m atCompartment: {#status->#I}) ].
	model addTransitionFrom: '{#status: #I}' 
			to: '{#status: #R}' 
			probability: [ :m | m atParameter: #gamma ].
	^ model