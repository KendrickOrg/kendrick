tests
testIBMOnSIRMetaPopulationWithMovementModel
	|model|
	model := self createSIRMetaPopulationWithMovementModel.
	model run: 'IBM' from: 0.0 to: 1000 step: 0.01 algorithm: #DiscreteTime.
	"model plot: #I."
	self assert: (model simulator data size) equals: 5.
	