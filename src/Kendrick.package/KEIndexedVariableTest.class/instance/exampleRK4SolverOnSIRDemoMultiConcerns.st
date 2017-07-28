as yet unclassified 
exampleRK4SolverOnSIRDemoMultiConcerns
	"self new exampleRK4SolverOnSIRDemoMultiConcerns"
	| model expr |
	model := self modelRK4SolverOnSIRDemoMultiConcerns.
	expr := self getIndexedExpressionForModel.
	self assert: (expr evaluateWithModel: model) equals: #(25 4)