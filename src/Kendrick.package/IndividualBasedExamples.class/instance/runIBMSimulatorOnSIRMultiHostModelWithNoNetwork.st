tests
runIBMSimulatorOnSIRMultiHostModelWithNoNetwork
	"self new runIBMSimulatorOnSIRMultiHostModelWithNoNetwork"
	|model|
	model := self createSIRMultiHostModel.
	model run: #IBMDiscreteTime from: 0.0 to: 1.0 step: 0.027.
	model plot: #I do: #sqrt.
	
	