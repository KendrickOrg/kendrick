tests
testRK4SolverOnSIRMetaPopulationModel
	|model|
	model := self createSIRMetaPopulationModel.	
	model run: 'deterministic' from: 0.0 to: 40.0 step: 0.01 algorithm: #RK4.
	model plot: #I do: #sqrt.
	self assert: (model simulator data size) equals: 3.
	self assert: ((model simulator data at: #(0 1)) at: #S) data size equals: 4000