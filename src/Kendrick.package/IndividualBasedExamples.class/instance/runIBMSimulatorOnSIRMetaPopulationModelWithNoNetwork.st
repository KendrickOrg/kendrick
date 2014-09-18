tests
runIBMSimulatorOnSIRMetaPopulationModelWithNoNetwork
	"self new runIBMSimulatorOnSIRMetaPopulationModelWithNoNetwork"
	|model|
	model := self createSIRMetaPopulationModel.
	model simulator addAdapter: KEGraphAdapter new.
	model run: #IBMDiscreteTime from: 0.0 to: 1.0 step: 0.027.
	model plot: #I do: #sqrt.
	
	