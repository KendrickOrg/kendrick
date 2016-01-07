examples
SEIRConcern
	"self new exampleRK4SolverOnSEIRMeaslesModel"

	| SEIRConcern |
	SEIRConcern := KEConcern new.
	SEIRConcern attributes: {#status->#(#S #E #I #R)}.
	SEIRConcern addParameters: { #beta. #gamma. #mu. #sigma }.
	SEIRConcern
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [ :aModel | 
			(aModel atParameter: #beta) * 
			(aModel atCompartment: {#status->#I}) ].
	SEIRConcern 
		addTransitionFrom: '{#status: #E}' 
		to: '{#status: #I}' 
		probability: [ :aModel | aModel atParameter: #sigma ].
	SEIRConcern 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #R}' 
		probability: [ :aModel | aModel atParameter: #gamma ].
	SEIRConcern 
		addTransitionFrom: '{#status: #S}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRConcern 
		addTransitionFrom: '{#status: #I}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRConcern 
		addTransitionFrom: '{#status: #R}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRConcern 
		addTransitionFrom: '{#status: #E}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRConcern 
		addTransitionFrom: #empty 
		to: '{#status: #S}' 
		probability: [ :aModel | aModel atParameter: #mu ].
	^ SEIRConcern