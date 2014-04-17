tests
testRK4SolverOnSIRSimpleModel
	|model|
	model := self createSIRSimpleModel.
	model run: 'deterministic' from: 0 to: 1 step: 0.01 algorithm: #RK4.
	self assert: (model simulator data size) equals: 3.
	self assert: (model simulator data at: #S) data size equals: 100