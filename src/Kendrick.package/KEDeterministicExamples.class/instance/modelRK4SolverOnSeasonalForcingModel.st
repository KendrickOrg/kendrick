examples
modelRK4SolverOnSeasonalForcingModel
	| tmp1 |
	tmp1 := KEModel new population: (KEPopulation size: 100000).
	tmp1
		attributes: {(#status -> #(#S #E #I #R))};
		atCompartment: {(#status -> #S)} put: 99999 atOthersPut: 0;
		atCompartment: {(#status -> #I)} put: 1;
		addParameters:
			{(#beta0 -> 0.0052).
			(#gamma -> 52).
			(#sigma -> 52).
			(#betaAmp -> 0.3).
			(#mu -> 0.0125)};
		addParameter: #beta value: 'beta0*(1 + (betaAmp*cos(t)))';
		addEquation: 'S:t=mu*N-beta*S*I-mu*S';
		addEquation: 'E:t=beta*S*I-sigma*E-mu*E';
		addEquation: 'I:t=sigma*E-gamma*I-mu*I';
		addEquation: 'R:t=gamma*I-mu*R'.
	^ tmp1