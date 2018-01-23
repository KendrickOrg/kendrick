tests
testEquationsToTransitions
	| model |
	model := KEModel new.
	model addEquation: 'S:t=mu*N - beta*S*I - mu*S'.
	model addEquation: 'I:t=beta*S*I - gamma*I - mu*I'.
	model addEquation: 'R:t=gamma*I - mu*R'.
	self assert: model transitions size equals: 6