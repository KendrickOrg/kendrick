as yet unclassified
testGenerateEventsOfSIRModel
	| tmp1 tmp2 tmp3 |
	tmp1 := KEModel new.
	tmp1
		addEquation: 'S:t=-beta*S*I';
		addEquation: 'I:t=beta*S*I-gamma*I';
		addEquation: 'R:t=gamma*I'.
	tmp3 := KEEventGenerator new.
	tmp2 := tmp3 generateEvents: tmp1.
	self assert: tmp2 size equals: 2