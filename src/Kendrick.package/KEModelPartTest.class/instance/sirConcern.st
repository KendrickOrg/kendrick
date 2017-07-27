tests-as yet unclassified
sirConcern
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		addParameters: {#beta . #gamma . #mu};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg2 | arg2 atParameter: #gamma ];
		addTransitionFrom: #empty
			to: {(#status -> #S)}
			probability: [ :arg3 | arg3 atParameter: #mu ];
		addTransitionFrom: {(#status -> #S)}
			to: #empty
			probability: [ :arg4 | arg4 atParameter: #mu ];
		addTransitionFrom: {(#status -> #I)}
			to: #empty
			probability: [ :arg5 | arg5 atParameter: #mu ];
		addTransitionFrom: {(#status -> #R)}
			to: #empty
			probability: [ :arg6 | arg6 atParameter: #mu ].
	^ tmp1