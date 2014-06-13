tests
testRK4SolverOnBilharzioseModel
	|model|
	model := self createBilharzioseModel.	
	model run: 'deterministic' from: 0.0 to: 3500 step: 1 algorithm: #RK4.
	model plot: #P.
	self assert: (model simulator data size) equals: 6.
	self assert: (model simulator data at: #S1) data size equals: 3500