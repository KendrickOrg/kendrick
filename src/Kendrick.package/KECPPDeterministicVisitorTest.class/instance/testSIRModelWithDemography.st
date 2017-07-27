as yet unclassified
testSIRModelWithDemography
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new.
	tmp1
		atCompartment: #S putNumberOfIndividuals: 99999;
		atCompartment: #I putNumberOfIndividuals: 1;
		atCompartment: #R putNumberOfIndividuals: 0;
		atParameter: #beta put: 0.0052;
		atParameter: #gamma put: 365 / 7;
		atParameter: #mu put: 1 / 80;
		atParameter: #N put: 100000;
		addEquation: 'S:t= mu*N-beta*S*I-mu*S';
		addEquation: 'I:t=beta*S*I-gamma*I-mu*I';
		addEquation: 'R:t=gamma*I-mu*R'.
	tmp2 := tmp1
		runDeterministSimulationFrom: 0.0
		to: 1.0
		withStep: 0.001.
	tmp3 := KECPPDeterministicVisitor new.
	tmp3 visitNode: tmp1.
	self
		assert: tmp3 compartments size = 3;
		assert: tmp3 parameters size = 4