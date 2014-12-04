tests
testEvaluateWithModel2
	|model expr|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 10000,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	model addParameter: '{#beta: 0.0052, #gamma: 52}'.
	expr := 'beta*S*I' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 52.