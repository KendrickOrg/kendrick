examples
runIBMSimulatorOnSIRDemographyModelWithNoNetwork
	"self new runIBMSimulatorOnSIRDemographyModelWithNoNetwork"
	|model simulator|
	"model := self createSIRModelWithDemography."
	"0.5 year and step = 1 day"
	"model run: 'IBM' from: 0.0 to: 1.0 step: 0.0027 algorithm: #DiscreteTime."
	model := self createSIRSimpleModel2.	
	simulator := KESimulatorBuilder new.
	simulator run: #IBMDiscreteTime tMin: 0 tMax: 730 step: 1 model: model.
	simulator plot: #(#S #I #R)
	