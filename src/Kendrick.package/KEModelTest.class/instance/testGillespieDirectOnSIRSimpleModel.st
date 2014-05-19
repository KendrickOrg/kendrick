tests
testGillespieDirectOnSIRSimpleModel
	|model|
	model := self createSIRSimpleModel.	
	model run: 'stochastic' from: 0.0 to: 0.5 step: 0.001 algorithm: #GillespieDirect.
	"model plot: #(#S #I #R)."
	self assert: (model simulator data size) equals: 3.
	