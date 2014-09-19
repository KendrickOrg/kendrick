tests
runRK4SolverOnSIRMultiHostModel
	"self new runRK4SolverOnSIRMultiHostModel"
	|model|
	model := self createSIRMultiHostModel.
	model run: #RK4 from: 0.0 to: 40 step: 0.01.
	model plot: #I do: #sqrt
	