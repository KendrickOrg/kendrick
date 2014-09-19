tests
runRK4SolverOnSIRMetaPopulationWithMovementModel
	"self new runRK4SolverOnSIRMetaPopulationWithMovementModel"
	|model |
	model := self createSIRMetaPopulationWithMovementModel.
	model simulator addAdapter: (KEGraphAdapter new).
	model run: #RK4 from: 0.0 to: 2910 step: 0.1.
	model plot: #I
	
															
														