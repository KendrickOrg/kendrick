tests
runRK4SolverOnSEIRMeaslesModel
	"self new runRK4SolverOnSEIRMeaslesModel"
	|model simulator|
	model := self createSEIRMeaslesModel.	
	simulator := KESimulatorBuilder new.
	
	simulator run: #RK4 tMin: 0.0 tMax: 100 step: 1 model: model.
	simulator plot: #(S I R)
	