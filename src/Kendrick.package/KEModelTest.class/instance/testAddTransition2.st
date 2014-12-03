tests-as yet unclassified
testAddTransition2
	|model|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 9999,
		{ #status: #I }: 1,
		{ #status: #R}: 0
	}'.
	model addTransition: (KETransition from: '{#status: #S}' to: '{#status: #I}' rate: 'beta*I' parseAsAnExpression).
	self assert: (model transitions size) equals: 1