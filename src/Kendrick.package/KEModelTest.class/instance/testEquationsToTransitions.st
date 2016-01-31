tests
testEquationsToTransitions
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addEquation: 'S:t=mu*N - beta*S*I - mu*S'.
	model addEquation: 'I:t=beta*S*I - gamma*I - mu*I'.
	model addEquation: 'R:t=gamma*I - mu*R'.
	
	self assert: (model transitions size) equals: 6