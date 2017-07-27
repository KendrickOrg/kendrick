examples
modelRK4SolverOnMultiStrainModel
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 10000).
	tmp1
		attributes: {(#status -> #(#S #I1 #I2 #R))};
		atCompartment: {(#status -> #S)} put: 9900;
		atCompartment: {(#status -> #I1)} put: 99;
		atCompartment: {(#status -> #I2)} put: 1;
		atCompartment: {(#status -> #R)} put: 0;
		addParameter: #beta1 value: 2.0e-5;
		addParameter: #beta2 value: 0.00018;
		addParameter: #gamma1 value: 0.1;
		addParameter: #gamma2 value: 1;
		addParameter: #mu value: 5.0e-5;
		addTransitionFrom: '{#status:#S}'
			to: '{#status: #I1}'
			probability: [ :arg1 | (arg1 atParameter: #beta1) * (arg1 atCompartment: {(#status -> #I1)}) ];
		addTransitionFrom: '{#status:#S}'
			to: '{#status:#I2}'
			probability: [ :arg2 | (arg2 atParameter: #beta2) * (arg2 atCompartment: {(#status -> #I2)}) ];
		addTransitionFrom: '{#status: #I1}'
			to: '{#status: #R}'
			probability: [ :arg3 | arg3 atParameter: #gamma1 ];
		addTransitionFrom: '{#status: #I2}'
			to: '{#status: #R}'
			probability: [ :arg4 | arg4 atParameter: #gamma2 ];
		addTransitionFrom: '{#status: #S}'
			to: #empty
			probability: [ :arg5 | arg5 atParameter: #mu ];
		addTransitionFrom: '{#status: #I1}'
			to: #empty
			probability: [ :arg6 | arg6 atParameter: #mu ];
		addTransitionFrom: '{#status: #I2}'
			to: #empty
			probability: [ :arg7 | arg7 atParameter: #mu ];
		addTransitionFrom: '{#status: #R}'
			to: #empty
			probability: [ :arg8 | arg8 atParameter: #mu ];
		addTransitionFrom: #empty
			to: '{#status: #S}'
			probability: [ :arg9 | arg9 atParameter: #mu ].
	^ tmp1