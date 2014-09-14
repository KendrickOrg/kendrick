tests
runIBMOnSIRMetaPopulationWithMovementModel
	"self new runIBMOnSIRMetaPopulationWithMovementModel"
	|model|
	model := self createSIRMetaPopulationWithMovementModel.
	model run: #IBMDiscreteTime from: 0.0 to: 10 step: 0.1.
	model plot: #I.
	