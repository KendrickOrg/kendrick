tests
testIBMSimulatorOnSIRModelWithNoNetwork
	|model|
	model := self createSIRSimpleModel.
	"0.5 year and step = 1 day" "about 1 minutes for result"
	model run: 'IBM' from: 0.0 to: 0.5 step: 0.0027 algorithm: #DiscreteTime.
	model plot: #I.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	