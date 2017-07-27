examples
exampleGillespieDirectOnSIRSimpleModel
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new population: (KEPopulation size: 10000).
	tmp1
		addAttribute: #status value: #(#S #I #R);
		atCompartment: {(#status -> #S)} put: 9999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 520).
			(#gamma -> 52)};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: [ :arg1 | 
			(arg1 atParameter: #beta) * (arg1 atCompartment: {(#status -> #I)})
				/ (arg1 atParameter: #N) ];
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: [ :arg2 | tmp1 atParameter: #gamma ].
	tmp2 := KESimulator
		new: #Gillespie
		from: 0.0
		to: 1.0
		by: 0.001.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp3 data: tmp2 timeSeries.
	^ tmp3 open