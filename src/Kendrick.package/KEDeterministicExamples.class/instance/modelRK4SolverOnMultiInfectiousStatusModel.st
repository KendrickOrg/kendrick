examples
modelRK4SolverOnMultiInfectiousStatusModel
	"self new exampleRK4SolverOnMultiInfectiousStatusModel"
	|model|
	model := KEModel new population: (KEPopulation size: 500).
	model attributes: {#status->#(S I Is R)}.
	model atCompartment: { #status->#S } put: 450.
	model atCompartment: { #status->#I } put: 10.
	model atCompartment: { #status->#Is } put: 40.
	model atCompartment: { #status->#R } put: 0.

	model addParameter: #beta1 value: 0.007.
	model addParameter: #beta2 value: 0.001.
	model addParameter: #delta value: 0.5.
	model addParameter: #gamma1 value: 0.5.
	model addParameter: #gamma2 value: 0.25.
	model 
		addTransitionFrom: '{#status: #S}' 
		to: '{#status: #I}' 
		probability: [ :m| 
			((m atParameter: #beta1) * 
			(m atCompartment: {#status->#I})) +
			((m atParameter: #beta2) * 
			(m atCompartment: {#status->#Is})) ].
	model
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #Is}' 
		probability: [ :m| m atParameter: #delta ].
	model 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status:#R}' 
		probability: [ :m| m atParameter: #gamma1 ].
	model
		addTransitionFrom: '{#status: #Is}' 
		to: '{#status: #R}' 
		probability: [ :m| m atParameter: #gamma2 ].
		
	^ model