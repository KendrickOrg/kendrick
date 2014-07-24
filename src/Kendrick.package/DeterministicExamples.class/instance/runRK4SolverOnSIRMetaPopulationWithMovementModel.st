tests
runRK4SolverOnSIRMetaPopulationWithMovementModel
	"self new runRK4SolverOnSIRMetaPopulationWithMovementModel"
	|model |
	model := self createSIRMetaPopulationWithMovementModel.
	model run: 'deterministic' from: 0.0 to: 2910 step: 0.1 algorithm: #RK4.
	""model plot: #I."""simulation run in 3 minutes"
	
	
															
														