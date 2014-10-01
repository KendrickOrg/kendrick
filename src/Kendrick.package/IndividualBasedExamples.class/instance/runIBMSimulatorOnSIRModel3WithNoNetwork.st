tests
runIBMSimulatorOnSIRModel3WithNoNetwork
	"self new runIBMSimulatorOnSIRModel3WithNoNetwork"
	|model simulator|
	model := self createSIRSimpleModel3.
	simulator := KESimulatorBuilder new. 
	"0.5 year and step = 1 day" "about 1 minutes for result"
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 200 step: 0.1 model: model.
	simulator plot: #(S I R).
	"(simulator data at: #I) save: 'I_0.dat'." 
	
	