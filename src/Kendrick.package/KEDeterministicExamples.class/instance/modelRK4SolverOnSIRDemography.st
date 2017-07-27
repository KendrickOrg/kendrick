examples
modelRK4SolverOnSIRDemography
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 5000).
	tmp1
		attributes: {(#status -> #(#S #I #R))};
		atCompartment: '{#status: #S}' put: 4975;
		atCompartment: '{#status: #I}' put: 25;
		atCompartment: '{#status: #R}' put: 0;
		addParameter: #beta value: 1 / 5000;
		addParameter: #gamma value: 1 / 10.0;
		addParameter: #mu value: 0.0005;
		addEquation: 'S:t=mu*N-beta*S*I-mu*S';
		addEquation: 'I:t=beta*S*I-gamma*I-mu*I';
		addEquation: 'R:t=gamma*I-mu*R'.
	^ tmp1