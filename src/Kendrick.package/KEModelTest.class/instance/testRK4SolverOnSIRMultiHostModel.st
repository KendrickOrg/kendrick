tests
testRK4SolverOnSIRMultiHostModel
	|model|
	model := self createSIRMultiHostModel.
	model run: 'deterministic' from: 0 to: 40 step: 0.01 algorithm: #RK4.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	self assert: (model simulator data at: #(1)) isDictionary equals: true.
	self assert: (model simulator data at: #(1)) size equals: 2.
	self assert: ((model simulator data at: #(1)) at: #S) data size equals: 4000