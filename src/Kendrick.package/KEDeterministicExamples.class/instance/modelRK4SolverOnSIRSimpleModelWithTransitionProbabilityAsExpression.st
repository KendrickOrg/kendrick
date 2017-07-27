examples
modelRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta -> 0.0052).
			(#gamma -> 52)};
		addTransitionFrom: '{#status: #S}'
			to: '{#status: #I}'
			probability: 'beta*I' parseAsAnExpression;
		addTransitionFrom: '{#status: #I}'
			to: '{#status: #R}'
			probability: 'gamma' parseAsAnExpression.
	^ tmp1