tests
testRK4SolverOnSIRSimpleModel
	|model|
	model := self createSIRSimpleModel.	
	self assert: (model simulator data size) equals: 3.
	self assert: (model simulator data at: #S) data size equals: 100