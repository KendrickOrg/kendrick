examples
SEIRSConcern
	"self new exampleRK4SolverOnSEIRMeaslesModel"

	| SEIRSConcern |
	SEIRSConcern := KEModelPart new.
	SEIRSConcern attributes: {#status->#(#S #E #I #R)}.
	SEIRSConcern addParameters: { #beta. #gamma. #mu. #sigma. #v }.
	SEIRSConcern addParameter: #lambda value: [ :aModel | 
			(aModel atParameter: #beta) * 
			(aModel atCompartment: {#status->#I}) / (aModel atParameter: #N) ].
	SEIRSConcern
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #E}'
		probability: [ :aModel | 
			(aModel atParameter: #lambda) ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #E}' 
		to: '{#status: #I}' 
		probability: [ :aModel | aModel atParameter: #sigma ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #I}' 
		to: '{#status: #R}' 
		probability: [ :aModel | aModel atParameter: #gamma ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #R}' 
		to: '{#status: #S}' 
		probability: [ :aModel | aModel atParameter: #v ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #S}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #I}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #R}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: '{#status: #E}' 
		to: #empty 
		probability: [ :aModel | aModel atParameter: #mu ].
	SEIRSConcern 
		addTransitionFrom: #empty 
		to: '{#status: #S}' 
		probability: [ :aModel | aModel atParameter: #mu ].
	^ SEIRSConcern