tests
runRK4SolverOnSIRMetaPopulationModel
	"self new runRK4SolverOnSIRMetaPopulationModel"
	|model|
	model := self createSIRMetaPopulationModel.	
	model run: 'deterministic' from: 0.0 to: 40.0 step: 0.01 algorithm: #RK4.
	model plot: #I do: #sqrt.
	