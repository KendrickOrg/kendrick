examples
modelRK4SolverOnSEIRMeasles
	"self new exampleRK4SolverOnSEIRMeaslesModel"

	| model |
	model := KEModel new.
	model population attributes: '{#status: [#S, #E, #I, #R]}'.
	model
		buildFromCompartments:
			'{
		{#status: #S}: 99999,
		{#status: #I}: 1,
		{#status: #E}: 0,
		{#status: #R}: 0
	}'.
	model addParameters: '{
		#beta: 0.0000214, 
		#gamma: 0.143, 
		#mu: 0.0000351, 
		#sigma: 0.125, 
		#N: #sizeOfPopulation}'.
	model
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [ :m | (m atParameter: #beta) * (m probabilityOfContact: '{#status:#I}') ].
	model 
		addTransitionFrom: '{#status: #E}' 
		to: '{#status: #I}' 
		probability: [ :m | m atParameter: #sigma ].
	model 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #R}' 
		probability: [ :m | m atParameter: #gamma ].
	model 
		addTransitionFrom: '{#status: #S}' 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: '{#status: #I}' 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: '{#status: #R}' 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: '{#status: #E}' 
		to: #empty 
		probability: [ :m | m atParameter: #mu ].
	model 
		addTransitionFrom: #empty 
		to: '{#status: #S}' 
		probability: [ :m | m atParameter: #mu ].
	^ model