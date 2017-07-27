as yet unclassified
testSIRIndividualBasedModel
	| tmp1 tmp2 tmp4 |
	tmp1 := KEModel new.
	tmp1
		atCompartment: #S putNumberOfIndividuals: 100000 - 1;
		atCompartment: #I putNumberOfIndividuals: 1;
		atCompartment: #R putNumberOfIndividuals: 0;
		atParameter: #beta put: 0.0052;
		atParameter: #gamma put: 365 / 7;
		addEquation: 'S:t=-beta*S*I';
		addEquation: 'I:t=beta*S*I-gamma*I';
		addEquation: 'R:t=gamma*I'.
	tmp4 := KEIndividualBasedSimulator new.
	tmp4
		tMin: 0.0;
		tMax: 1.0;
		step: 0.0027;
		model: tmp1.
	tmp1 simulator: (tmp4 algorithm: #default).
	tmp1 simulator
		generateTransitionOfEvents;
		initializeListIndividuals.
	tmp2 := KECPPIndividualBasedVisitor new.
	tmp2 visitNode: tmp1.
	self
		assert: tmp2 compartments size = 3;
		assert: tmp2 parameters size = 2