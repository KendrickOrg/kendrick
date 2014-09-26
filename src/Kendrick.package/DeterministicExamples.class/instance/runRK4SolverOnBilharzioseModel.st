tests
runRK4SolverOnBilharzioseModel
	"self new runRK4SolverOnBilharzioseModel"
	|model simulator|
	model := self createBilharzioseModel.	
	simulator := KESimulatorBuilder new.
	simulator run: #RK4 tMin: 0.0 tMax: 3500 step: 1 model: model. 
	simulator plot: #P
	