as yet unclassified
testSIRStochasticModel
	| tmp1 tmp2 |
	tmp1 := KEModel new.
	tmp1
		atCompartment: #S putNumberOfIndividuals: 100000 - 1;
		atCompartment: #I putNumberOfIndividuals: 1;
		atCompartment: #R putNumberOfIndividuals: 0;
		atParameter: #beta put: 0.0052;
		atParameter: #gamma put: 365 / 7;
		addEquation: 'S:t=-beta*S*I';
		addEquation: 'I:t=beta*S*I-gamma*I';
		addEquation: 'R:t=gamma*I';
		runStochasticSimulationFrom: 0 to: 50 / 365 withStep: 0.5 / 365.
	tmp2 := KECPPStochasticVisitor new.
	tmp2 visitNode: tmp1.
	self
		assert: tmp2 compartments size = 3;
		assert: tmp2 parameters size = 2