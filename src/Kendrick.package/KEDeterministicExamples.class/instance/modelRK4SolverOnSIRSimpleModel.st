examples
modelRK4SolverOnSIRSimpleModel
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		population: (KEPopulation size: 100000);
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 99999;
		atCompartment: {(#status -> #I)} put: 1;
		atCompartment: {(#status -> #R)} put: 0;
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg2 | arg2 atParameter: #gamma ].
	^ tmp1