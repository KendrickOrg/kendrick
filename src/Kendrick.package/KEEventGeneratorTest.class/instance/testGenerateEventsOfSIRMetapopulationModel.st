as yet unclassified
testGenerateEventsOfSIRMetapopulationModel
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new.
	tmp1
		addEquation: 'S:t=mu*N-beta*S*I-mu*S';
		addEquation: 'I:t=beta*S*I-v*I-mu*I';
		addEquation: 'R:t=v*I-mu*R'.
	tmp3 := KEEventGenerator new.
	tmp2 := tmp3 generateEvents: tmp1.
	self assert: tmp2 size equals: 6