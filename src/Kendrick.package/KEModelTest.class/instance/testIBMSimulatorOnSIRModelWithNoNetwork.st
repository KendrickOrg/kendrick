tests
testIBMSimulatorOnSIRModelWithNoNetwork
	|model|
	model := self createSIRSimpleModel4: nil.
	model run: 'IBM' from: 0.0 to: 100 step: 0.1 algorithm: #DiscreteTime.
	model plot: #I.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	