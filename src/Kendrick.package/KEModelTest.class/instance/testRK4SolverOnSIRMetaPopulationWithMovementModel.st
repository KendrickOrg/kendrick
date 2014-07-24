tests
testRK4SolverOnSIRMetaPopulationWithMovementModel
	|model |
	model := self createSIRMetaPopulationWithMovementModel.
	model run: 'deterministic' from: 0.0 to: 2910 step: 0.1 algorithm: #RK4.
	""model plot: #I."""simulation run in 3 minutes"
	self assert: (model simulator data size) equals: 5.
	self assert: ((model simulator data at: #(0 1)) at: #S) data size equals: 29100.
	
															
														