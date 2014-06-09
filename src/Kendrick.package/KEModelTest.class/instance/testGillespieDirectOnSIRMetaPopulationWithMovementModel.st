tests
testGillespieDirectOnSIRMetaPopulationWithMovementModel
	|model|
	model := self createSIRMetaPopulationWithMovementModel.
	model run: 'stochastic' from: 0.0 to: 1000 step: 0.1 algorithm: #GillespieDirect.
	model plot: #I.
	self assert: (model simulator data size) equals: 5.
	