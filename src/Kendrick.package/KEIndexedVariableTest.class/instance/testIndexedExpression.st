tests
testIndexedExpression
	| model expr |
	model := self modelSIRDemoMultiConcerns.
	expr := self getIndexedExpressionForModel.
	self assert: (expr evaluateWithModel: model) equals: #(25 4)