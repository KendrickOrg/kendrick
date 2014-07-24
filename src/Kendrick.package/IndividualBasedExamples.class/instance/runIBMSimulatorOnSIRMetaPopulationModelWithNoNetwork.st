tests
runIBMSimulatorOnSIRMetaPopulationModelWithNoNetwork
	"self new runIBMSimulatorOnSIRMetaPopulationModelWithNoNetwork"
	|model|
	model := self createSIRMetaPopulationModel.
	model run: 'IBM' from: 0.0 to: 1.0 step: 0.027 algorithm: #DiscreteTime.
	model plot: #I do: #sqrt.
	
	