tests
testEvaluateWithModel
	|model expr|
	model := KEModel new.
	model buildFromCompartments: '{
		{ #status: #S }: 99999,
		{ #status: #I }: 1,
		{ #status: #R }: 0
	}'.
	expr := 'S' parseAsAnExpression.
	self assert: (expr evaluateWithModel: model) equals: 99999.