tests
runRK4SolverOnBilharzioseModel
	"self new runRK4SolverOnBilharzioseModel"
	|model|
	model := self createBilharzioseModel.	
	model run: 'deterministic' from: 0.0 to: 3500 step: 1 algorithm: #RK4.
	model plot: #P.
	