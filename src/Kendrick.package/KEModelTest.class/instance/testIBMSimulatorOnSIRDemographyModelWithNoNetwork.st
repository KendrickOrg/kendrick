tests
testIBMSimulatorOnSIRDemographyModelWithNoNetwork
	|model|
	model := self createSIRModelWithDemography.
	"0.5 year and step = 1 day"
	model run: 'IBM' from: 0.0 to: 1.0 step: 0.0027 algorithm: #DiscreteTime.
	model plot: #R.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	