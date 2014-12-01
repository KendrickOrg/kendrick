tests
testEquationsToTransitions2
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S, #specie: #mosquito }: 9999,
		{ #status: #I, #specie: #mosquito }: 1,
		{ #status: #R, #specie: #mosquito }: 0,
		{ #status: #S, #specie: #reservoir1 }: 999,
		{ #status: #I, #specie: #reservoir1 }: 1,
		{ #status: #R, #specie: #reservoir1 }: 0,
		{ #status: #S, #specie: #reservoir2 }: 1999,
		{ #status: #I, #specie: #reservoir2 }: 1,
		{ #status: #R, #specie: #reservoir2 }: 0
	}'.
	model addEquation: 'S:t=mu*N-beta*S*I-mu*S' parseAsAnEquation.
	model addEquation: ('I:t=beta*S*I-(mu+v)*I' parseAsAnEquation).
	model addEquation: ('R:t=v*I-mu*R' parseAsAnEquation).
	
	self assert: (model transitions size) equals: 18
	
	