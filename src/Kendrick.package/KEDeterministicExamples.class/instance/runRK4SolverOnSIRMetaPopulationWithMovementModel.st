examples
runRK4SolverOnSIRMetaPopulationWithMovementModel
	"self new runRK4SolverOnSIRMetaPopulationWithMovementModel"
	|model simulator|
	model := self createSIRMetaPopulationWithMovementModel.
	simulator := KESimulatorBuilder new.
	simulator addAdapter: KEMovementAdapter new.
	simulator run: #RK4 tMin: 0.0 tMax: 2910 step: 0.1 model: model.
	simulator plot: #I
	
															
														