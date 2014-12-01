tests
testEquationsToTransitions
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addEquation: 'S:t=mu*N - beta*S*I - mu*S' parseAsAnEquation.
	model addEquation: 'I:t=beta*S*I - gamma*I - mu*I' parseAsAnEquation.
	model addEquation: 'R:t=gamma*I - mu*R' parseAsAnEquation.
	
	self assert: (model transitions size) equals: 6