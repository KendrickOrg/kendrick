as yet unclassified 
exampleIndexedExpression
	"self new exampleRK4SolverOnSIRDemoMultiConcerns"
	| model expr |
	model := self modelRK4SolverOnSIRDemoMultiConcerns.
	expr := self getIndexedExpressionForModel.
	self assert: (expr evaluateWithModel: model) equals: #(25 4)