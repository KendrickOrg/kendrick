examples
exampleIBMSimulatorOnSIRModel2
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new population: (KEPopulation size: 100).
	tmp1
		addAttribute: #status value: #(#S #I #R);
		atCompartment: {(#status -> #S)} put: 99 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 0.01).
			(#gamma -> 0.1)};
		addTransitionFrom: '{#status:#S}'
			to: '{#status:#I}'
			probability: [ :arg1 | (arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)}) ];
		addTransitionFrom: '{#status:#I}'
			to: '{#status:#R}'
			probability: [ :arg2 | arg2 atParameter: #gamma ].
	tmp2 := KESimulator
		new: #IBM
		from: 0.0
		to: 50
		by: 0.1.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new
		data: (tmp2 allTimesSeriesContaining: '{#status:#I}').
	^ tmp3 open