tests
runIBMSimulatorOnSIRModelWithNoNetwork
	"self new runIBMSimulatorOnSIRModelWithNoNetwork"
	|model|
	model := self createSIRSimpleModel.
	"0.5 year and step = 1 day" "about 1 minutes for result"
	model run: #IBMDiscreteTime from: 0.0 to: 0.5 step: 0.0027.
	model plot: #I.
	
	