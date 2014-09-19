tests
runRK4SolverOnSIRMetaPopulationModel
	"self new runRK4SolverOnSIRMetaPopulationModel"
	|model|
	model := self createSIRMetaPopulationModel.	
	model simulator addAdapter: (KEGraphAdapter new).
	model run: #RK4 from: 0.0 to: 40.0 step: 0.01.
	model plot: #I do: #sqrt
	