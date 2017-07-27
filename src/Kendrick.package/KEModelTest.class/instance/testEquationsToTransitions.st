tests
testEquationsToTransitions
	| tmp1 |
	tmp1 := KEModel new.
	tmp1
		addEquation: 'S:t=mu*N - beta*S*I - mu*S';
		addEquation: 'I:t=beta*S*I - gamma*I - mu*I';
		addEquation: 'R:t=gamma*I - mu*R'.
	self assert: tmp1 transitions size equals: 6