tests
runRK4SolverOnSIRSimpleModel
	"self new runRK4SolverOnSIRSimpleModel"
	|model|
	model := self createSIRSimpleModel3.	
	model run: #RK4 from: 0.0 to: 200 step: 1.
	model plot: #(S I R)
	