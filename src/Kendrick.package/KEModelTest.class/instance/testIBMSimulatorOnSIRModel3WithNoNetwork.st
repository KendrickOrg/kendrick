tests
testIBMSimulatorOnSIRModel3WithNoNetwork
	|model|
	model := self createSIRSimpleModel3.
	"0.5 year and step = 1 day" "about 1 minutes for result"
	model run: 'IBM' from: 0.0 to: 200 step: 1 algorithm: #DiscreteTime.
	model plot: #(S I R).
	self assert: (model simulator data isDictionary) equals: true.
	self assert: (model simulator data size) equals: 3.
	