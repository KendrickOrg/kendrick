tests
runIBMSimulatorOnSIRDemographyModelWithNoNetwork
	"self new runIBMSimulatorOnSIRDemographyModelWithNoNetwork"
	|model|
	"model := self createSIRModelWithDemography."
	"0.5 year and step = 1 day"
	"model run: 'IBM' from: 0.0 to: 1.0 step: 0.0027 algorithm: #DiscreteTime.
	model plot: #(#S #I #R).
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3."
	model := self createSIRSimpleModel2.	
	model run: 'IBM' from: 0 to: 730 step: 1 algorithm: #DiscreteTime.
	model plot: #(#S #I #R).
	