tests
runRK4SolverOnBilharzioseModel
	"self new runRK4SolverOnBilharzioseModel"
	|model|
	model := self createBilharzioseModel.	
	self halt.
	model run: #RK4 from: 0.0 to: 3500 step: 1.
	model plot: #P.
	