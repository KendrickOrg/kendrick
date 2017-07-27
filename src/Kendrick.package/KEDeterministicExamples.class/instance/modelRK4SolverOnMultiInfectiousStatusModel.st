examples
modelRK4SolverOnMultiInfectiousStatusModel
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 500).
	tmp1
		attributes: {(#status -> #(#S #I #Is #R))};
		atCompartment: {(#status -> #S)} put: 450;
		atCompartment: {(#status -> #I)} put: 10;
		atCompartment: {(#status -> #Is)} put: 40;
		atCompartment: {(#status -> #R)} put: 0;
		addParameter: #beta1 value: 0.007;
		addParameter: #beta2 value: 0.001;
		addParameter: #delta value: 0.5;
		addParameter: #gamma1 value: 0.5;
		addParameter: #gamma2 value: 0.25;
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :arg1 | 
			(arg1 atParameter: #beta1) * (arg1 atCompartment: {(#status -> #I)})
				+ ((arg1 atParameter: #beta2) * (arg1 atCompartment: {(#status -> #Is)})) ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #Is}'
			probability: [ :arg2 | arg2 atParameter: #delta ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status:#R}'
			probability: [ :arg3 | arg3 atParameter: #gamma1 ];
		addTransitionFrom: '{#status: #Is}'
			to: '{#status: #R}'
			probability: [ :arg4 | arg4 atParameter: #gamma2 ].
	^ tmp1