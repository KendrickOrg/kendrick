as yet unclassified
testSEIRModelWithVaccination
	| tmp1 tmp2 tmp3 |
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
		atParameter: #p put: 0.0;
		atParameter: #N put: 100000;
		addEquation: 'S:t=mu*(1-p)*N-beta*S*I-mu*S';
		addEquation: 'E:t=beta*S*I-sigma*E-mu*E';
		addEquation: 'I:t=sigma*E-gamma*I-mu*I';
		addEquation: 'R:t=mu*p*N*gamma*I-mu*R'.
	tmp2 := tmp1 runDeterministSimulationFrom: 0 to: 100 withStep: 0.01.
	tmp3 := KECPPDeterministicVisitor new.
	tmp3 visitNode: tmp1.
	self
		assert: tmp3 compartments size = 4;
		assert: tmp3 parameters size = 6