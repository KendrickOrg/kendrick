examples
runIBMSimulatorOnSIRMetaPopulationModelWithNoNetwork
	"self new runIBMSimulatorOnSIRMetaPopulationModelWithNoNetwork"
	|model simulator|
	model := self createSIRMetaPopulationModel.
	simulator := KESimulatorBuilder new.
	simulator addAdapter: KECouplingAdapter new.
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 1.0 step: 0.0027 model: model.
	simulator plot: #I do: #sqrt.
	
	