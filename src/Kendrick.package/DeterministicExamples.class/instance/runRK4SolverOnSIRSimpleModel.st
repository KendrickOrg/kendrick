tests
runRK4SolverOnSIRSimpleModel
	"self new runRK4SolverOnSIRSimpleModel"
	|model simulator|
	model := self createSIRSimpleModel3.	
	simulator := KESimulatorBuilder new.
	
	simulator run: #RK4 tMin: 0.0 tMax: 200 step: 1 model: model.
	simulator plot: #(S I R)
	