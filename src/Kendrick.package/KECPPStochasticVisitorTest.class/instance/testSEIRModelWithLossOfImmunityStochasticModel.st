as yet unclassified
testSEIRModelWithLossOfImmunityStochasticModel
	| tmp1 tmp2 tmp4 |
	tmp1 := KEModel new.
	tmp1
		atCompartment: #S putNumberOfIndividuals: 99999;
		atCompartment: #E putNumberOfIndividuals: 1;
		atCompartment: #I putNumberOfIndividuals: 1;
		atCompartment: #R putNumberOfIndividuals: 0;
		atParameter: #beta put: 0.0052;
		atParameter: #gamma put: 365 / 7;
		atParameter: #sigma put: 365 / 7;
		atParameter: #mu put: 1 / 80;
		atParameter: #to put: 2;
		atParameter: #N put: 100000;
		addEquation: 'S:t=mu*N-beta*S*I-mu*S+to*R';
		addEquation: 'E:t=beta*S*I-sigma*E-mu*E';
		addEquation: 'I:t=sigma*E-gamma*I-mu*I';
		addEquation: 'R:t=gamma*I-mu*R-to*R'.
	tmp4 := KEStochasticSimulator new.
	tmp4
		tMin: 0.0;
		tMax: 1.0;
		step: 0.001;
		model: tmp1.
	tmp1
		simulator: (tmp4 algorithm: #GillespieDirect);
		generateEvents.
	tmp2 := KECPPStochasticVisitor new.
	tmp2 visitNode: tmp1.
	self
		assert: tmp2 compartments size = 4;
		assert: tmp2 parameters size = 6