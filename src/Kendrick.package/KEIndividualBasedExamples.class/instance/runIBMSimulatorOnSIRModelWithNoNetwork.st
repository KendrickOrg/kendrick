examples
runIBMSimulatorOnSIRModelWithNoNetwork
	"self new runIBMSimulatorOnSIRModelWithNoNetwork"
	|model simulator|
	model := self createSIRSimpleModel.
	simulator := KESimulatorBuilder new.
	"0.5 year and step = 1 day" "about 1 minutes for result"
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 0.5 step: 0.0027 model: model.
	simulator plot: #I
	
	