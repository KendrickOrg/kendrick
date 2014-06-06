tests
testIBMSimulatorOnSIRMultiHostModelWithNoNetwork
	|model|
	model := self createSIRMultiHostModel.
	model run: 'IBM' from: 0.0 to: 1.0 step: 0.027 algorithm: #DiscreteTime.
	self halt.
	model plot: #S do: #sqrt.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	