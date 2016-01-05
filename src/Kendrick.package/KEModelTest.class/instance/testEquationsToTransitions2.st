tests
testEquationsToTransitions2
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S, #species: #mosquito }: 9999,
		{ #status: #I, #species: #mosquito }: 1,
		{ #status: #R, #species: #mosquito }: 0,
		{ #status: #S, #species: #reservoir1 }: 999,
		{ #status: #I, #species: #reservoir1 }: 1,
		{ #status: #R, #species: #reservoir1 }: 0,
		{ #status: #S, #species: #reservoir2 }: 1999,
		{ #status: #I, #species: #reservoir2 }: 1,
		{ #status: #R, #species: #reservoir2 }: 0
	}'.
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: ('I:t=beta*S*I-(mu+v)*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).
	
	self assert: (model transitions size) equals: 6
	
	