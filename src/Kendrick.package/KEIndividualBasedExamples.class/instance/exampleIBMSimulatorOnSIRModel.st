examples
exampleIBMSimulatorOnSIRModel
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		addAttribute: #status value: #(#S #I #R);
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg2 | arg2 atParameter: #gamma ].
	tmp2 := KESimulator
		new: #IBM
		from: 0.0
		to: 1.0
		by: 0.0027.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp3 data: (tmp2 allTimesSeriesContaining: '{#status: #I}').
	^ tmp3 open