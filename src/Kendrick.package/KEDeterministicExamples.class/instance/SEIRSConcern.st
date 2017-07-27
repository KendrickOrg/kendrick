examples
SEIRSConcern
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		attributes: {(#status -> #(#S #E #I #R))};
		addParameters: {#beta . #gamma . #mu . #sigma . #v};
		addParameter: #lambda
			value: [ :arg1 | 
			(arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)})
				/ (arg1 atParameter: #N) ];
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #E}'
			probability: [ :arg2 | arg2 atParameter: #lambda ];
		addTransitionFrom: '{#status: #E}'
			to: '{#status: #I}'
			probability: [ :arg3 | arg3 atParameter: #sigma ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg4 | arg4 atParameter: #gamma ];
		addTransitionFrom: '{#status: #R}'
			to: '{#status: #S}'
			probability: [ :arg5 | arg5 atParameter: #v ];
		addTransitionFrom: '{#status: #S}'
			to: #empty
			probability: [ :arg6 | arg6 atParameter: #mu ];
		addTransitionFrom: '{#status: #I}'
			to: #empty
			probability: [ :arg7 | arg7 atParameter: #mu ];
		addTransitionFrom: '{#status: #R}'
			to: #empty
			probability: [ :arg8 | arg8 atParameter: #mu ];
		addTransitionFrom: '{#status: #E}'
			to: #empty
			probability: [ :arg9 | arg9 atParameter: #mu ];
		addTransitionFrom: #empty
			to: '{#status: #S}'
			probability: [ :arg10 | arg10 atParameter: #mu ].
	^ tmp1