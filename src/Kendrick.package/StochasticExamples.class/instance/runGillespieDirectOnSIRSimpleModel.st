tests
runGillespieDirectOnSIRSimpleModel
	"self new runGillespieDirectOnSIRSimpleModel"
	|model|
	model := self createSIRSimpleModel.	
	model run: 'stochastic' from: 0.0 to: 1.0 step: 0.001 algorithm: #GillespieDirect.
	model plot: #(#S #I #R).
	
	