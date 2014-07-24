tests
runRK4SolverOnSIRSimpleModel
	"self new runRK4SolverOnSIRSimpleModel"
	|model|
	model := self createSIRSimpleModel3.	
	model run: 'deterministic' from: 0.0 to: 200 step: 1 algorithm: #RK4.
	model plot: #(S I R).
	