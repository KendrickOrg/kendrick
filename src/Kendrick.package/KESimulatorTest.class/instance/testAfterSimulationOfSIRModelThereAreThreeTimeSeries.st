tests
testAfterSimulationOfSIRModelThereAreThreeTimeSeries
	| tmp1 tmp2 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
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
	self assert: tmp2 timeSeries size equals: 3