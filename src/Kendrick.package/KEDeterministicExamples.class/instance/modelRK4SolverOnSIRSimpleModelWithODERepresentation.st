examples
modelRK4SolverOnSIRSimpleModelWithODERepresentation
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 99999;
		atCompartment: {(#status -> #I)} put: 1;
		atCompartment: {(#status -> #R)} put: 0;
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)};
		addEquation: 'S:t=-beta*S*I';
		addEquation: 'I:t=beta*S*I - gamma*I';
		addEquation: 'R:t=gamma*I'.
	^ tmp1