tests-as yet unclassified
sirConcern
| sirConcern |
	sirConcern := KEConcern new.
	sirConcern attributes: 
		{#status->#(#S #I #R)}.
	sirConcern addParameters: {#beta. #gamma. #mu}.
	sirConcern
		addTransitionFrom: '{#status: #S}'
		to: '{#status: #I}'
		probability: [ :aModel | 
			(aModel atParameter: #beta) * 
			(aModel atCompartment: {#status->#I}) ].
	sirConcern addTransitionFrom: '{#status: #I}' 
			to: '{#status: #R}' 
			probability: [ :aModel | aModel atParameter: #gamma ].
	sirConcern addTransitionFrom: #empty 
			to: { #status -> #S } 
			probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: { #status -> #S } 
			to: #empty 
			probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: { #status -> #I } 
			to: #empty 
			probability: [ :aModel | aModel atParameter: #mu ].
	sirConcern addTransitionFrom: { #status -> #R } 
			to: #empty 
			probability: [ :aModel | aModel atParameter: #mu ].
	^ sirConcern