tests-as yet unclassified
testEquationsToTransitions
	|c|
	c := KEConcern new.
	c addEquation: 'S:t=mu*N-beta*S*I/N-mu*S'.
	c addEquation: 'I:t=beta*S*I/N-gamma*I-mu*I'.
	c addEquation: 'R:t=gamma*I-mu*R'.
	self assert: c transitions size equals: 6.