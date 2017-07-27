examples
exampleExplicitTauLeapOnSIRSimpleModel
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new population: (KEPopulation size: 5000).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 4975 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 25;
		addParameters:
			{(#beta -> 0.073).
			(#gamma -> 36.5).
			(#mu -> 0.01825)};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg2 | arg2 atParameter: #gamma ];
		addTransitionFrom: '{#status: #S}'
			to: #empty
			probability: [ :arg3 | arg3 atParameter: #mu ];
		addTransitionFrom: '{#status: #I}'
			to: #empty
			probability: [ :arg4 | arg4 atParameter: #mu ];
		addTransitionFrom: '{#status: #R}'
			to: #empty
			probability: [ :arg5 | arg5 atParameter: #mu ];
		addTransitionFrom: #empty
			to: '{#status: #S}'
			probability: [ :arg6 | arg6 atParameter: #mu ].
	tmp2 := KESimulator
		new: #TauLeap
		from: 0
		to: 0.4
		by: 0.0027.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp3 data: tmp2 timeSeries.
	^ tmp3 open