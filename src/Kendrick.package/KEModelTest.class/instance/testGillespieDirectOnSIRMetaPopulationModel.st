tests
testGillespieDirectOnSIRMetaPopulationModel
	|model|
	model := self createSIRMetaPopulationModel. 	
	model run: 'stochastic' from: 0.0 to: 1.0 step: 0.001 algorithm: #GillespieDirect.
	model plot: #I do: #sqrt.
	self assert: (model simulator data size) equals: 3.
	