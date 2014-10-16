examples
runIBMOnSIRMetaPopulationWithMovementModel
	"self new runIBMOnSIRMetaPopulationWithMovementModel"
	|model simulator|
	model := self createSIRMetaPopulationWithMovementModel.
	simulator := KESimulatorBuilder new.
	simulator addAdapter: KEMovementAdapter new.
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 1000 step: 0.1 model: model.
	simulator plot: #I
	