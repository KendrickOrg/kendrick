tests-as yet unclassified
testEquationsToTransitions
	| tmp1 |
	tmp1 := KEModelPart new.
	tmp1
		addEquation: 'S:t=mu*N-beta*S*I/N-mu*S';
		addEquation: 'I:t=beta*S*I/N-gamma*I-mu*I';
		addEquation: 'R:t=gamma*I-mu*R'.
	self assert: tmp1 transitions size equals: 6