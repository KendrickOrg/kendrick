examples
SIRConcern
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		addParameters: {#beta . #gamma};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg2 | arg2 atParameter: #gamma ].
	^ tmp1