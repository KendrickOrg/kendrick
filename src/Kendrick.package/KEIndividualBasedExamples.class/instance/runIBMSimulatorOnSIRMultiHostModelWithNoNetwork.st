examples
runIBMSimulatorOnSIRMultiHostModelWithNoNetwork
	"self new runIBMSimulatorOnSIRMultiHostModelWithNoNetwork"
	|model simulator|
	model := self createSIRMultiHostModel.
	simulator := KESimulatorBuilder new.
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 1.0 step: 0.0027 model: model.
	simulator plot: #I do: #sqrt
	
	