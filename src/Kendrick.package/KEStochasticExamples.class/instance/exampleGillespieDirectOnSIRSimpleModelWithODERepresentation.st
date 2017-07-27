examples
exampleGillespieDirectOnSIRSimpleModelWithODERepresentation
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		addAttribute: #status value: #(#S #I #R);
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)};
		addEquation: 'S:t=-beta*S*I';
		addEquation: 'I:t=beta*S*I - gamma*I';
		addEquation: 'R:t=gamma*I'.
	tmp2 := KESimulator
		new: #Gillespie
		from: 0.0
		to: 1.0
		by: 0.001.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp3 data: tmp2 timeSeries.
	^ tmp3 view