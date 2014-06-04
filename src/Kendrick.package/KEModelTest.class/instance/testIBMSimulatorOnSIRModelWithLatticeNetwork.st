tests
testIBMSimulatorOnSIRModelWithLatticeNetwork
	|model|
	model := self createSIRSimpleModel4: 'lattice'.
	model run: 'IBM' from: 0.0 to: 100 step: 0.1 algorithm: #DiscreteTime.
	model plot: #R.
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	