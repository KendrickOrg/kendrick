examples
exampleGillespieDirectOnSEIRMeaslesModel
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes: {(#status -> #(#S #E #I #R))};
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 0.00782).
			(#gamma -> 52.14).
			(#mu -> 0.0128).
			(#sigma -> 45.625)};
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
	tmp2 := KESimulator
		new: #Gillespie
		from: 0.0
		to: 0.5
		by: 0.0027.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new
		data: (tmp2 allTimesSeriesContaining: '{#status: #I}').
	^ tmp3 open