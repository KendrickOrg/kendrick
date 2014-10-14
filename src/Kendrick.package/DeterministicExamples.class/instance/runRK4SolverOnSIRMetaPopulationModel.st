tests
runRK4SolverOnSIRMetaPopulationModel
	"self new runRK4SolverOnSIRMetaPopulationModel"
	|model simulator|
	model := self createSIRMetaPopulationModel.	
	simulator := KESimulatorBuilder new.
	simulator addAdapter: KECouplingAdapter new.
	simulator run: #RK4 tMin: 0.0 tMax: 40.0 step: 0.01 model: model.
	simulator plot: #I do: #sqrt
	