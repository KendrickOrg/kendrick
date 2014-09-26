tests
runRK4SolverOnSIRMultiHostModel
	"self new runRK4SolverOnSIRMultiHostModel"
	|model simulator|
	model := self createSIRMultiHostModel.
	simulator := KESimulatorBuilder new.
	simulator run: #RK4 tMin: 0.0 tMax: 40 step: 0.01 model: model.
	simulator plot: #I do: #sqrt
	