examples
modelRK4SolverOnSEIRMeasles
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		addAttribute: #status value: #(#S #E #I #R);
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 2.14e-5).
			(#gamma -> 0.143).
			(#mu -> 3.51e-5).
			(#sigma -> 0.125)};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #E}'
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: '{#status: #E}'
			to: '{#status: #I}'
			probability: [ :arg2 | arg2 atParameter: #sigma ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg3 | arg3 atParameter: #gamma ];
		addTransitionFrom: '{#status: #S}'
			to: #empty
			probability: [ :arg4 | arg4 atParameter: #mu ];
		addTransitionFrom: '{#status: #I}'
			to: #empty
			probability: [ :arg5 | arg5 atParameter: #mu ];
		addTransitionFrom: '{#status: #R}'
			to: #empty
			probability: [ :arg6 | arg6 atParameter: #mu ];
		addTransitionFrom: '{#status: #E}'
			to: #empty
			probability: [ :arg7 | arg7 atParameter: #mu ];
		addTransitionFrom: #empty
			to: '{#status: #S}'
			probability: [ :arg8 | arg8 atParameter: #mu ].
	^ tmp1