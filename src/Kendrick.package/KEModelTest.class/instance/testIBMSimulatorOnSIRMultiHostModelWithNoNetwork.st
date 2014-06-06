tests
testIBMSimulatorOnSIRMultiHostModelWithNoNetwork
	|model|
	model := self createSIRMultiHostModel.
	model run: 'IBM' from: 0.0 to: 5.0 step: 0.0001 algorithm: #DiscreteTime.
	model plot: #I do: #sqrt.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	