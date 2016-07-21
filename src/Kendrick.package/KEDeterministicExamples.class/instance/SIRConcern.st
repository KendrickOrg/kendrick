examples
SIRConcern

	| SIRConcern |
	SIRConcern := KEModelPart new.
	SIRConcern attributes: 
		{#status->#(#S #I #R)}.
	SIRConcern addParameters: {#beta. #gamma}.
	SIRConcern
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :aModel | 
			(aModel atParameter: #beta) * 
			(aModel atCompartment: {#status->#I}) ].
	SIRConcern addTransitionFrom: '{#status: #I}' 
			to: '{#status: #R}' 
			probability: [ :aModel | aModel atParameter: #gamma ].
	^ SIRConcern