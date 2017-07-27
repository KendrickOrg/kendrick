as yet unclassified 
exampleRK4SolverOnSIRDemoMultiConcerns
	| tmp1 tmp2 |
	tmp1 := self modelRK4SolverOnSIRDemoMultiConcerns.
	tmp2 := self getIndexedExpressionForModel.
	self assert: (tmp2 evaluateWithModel: tmp1) equals: #(25 4)