tests
testEvaluateForceOfInfection
	|model|
	model := KEModel new.
	model population attributes: '{#status: [#S, #I, #R]}'.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameter: #beta value: 1.
	model forceOfInfection: #lambda formula: ('beta*I' parseAsAnExpression).  
	model currentCompartment: (Dictionary newFrom: {#status->#S}).
	self assert: (model evaluateForceOfInfection: #lambda) equals: 1.

