as yet unclassified 
exampleRK4SolverOnSIRDemoMultiConcerns
	"self new exampleRK4SolverOnSIRDemoMultiConcerns"
	"Created by ThanhNT 21/7/2017"
	|model expr|
	model := self modelRK4SolverOnSIRDemoMultiConcerns.
	expr := self getIndexedExpressionForModel .
	"expr := 'gamma[i]*beta[i]' parseAsAnExpression."
	
	self assert: (expr evaluateWithModel: model) equals: #(20 4).
	