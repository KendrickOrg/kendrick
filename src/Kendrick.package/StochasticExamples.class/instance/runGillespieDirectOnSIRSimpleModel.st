tests
runGillespieDirectOnSIRSimpleModel
	"self new runGillespieDirectOnSIRSimpleModel"
	|model|
	model := self createSIRSimpleModel.	
	model run: #GillespieDirect from: 0.0 to: 1.0 step: 0.001.
	model plot: #(#S #I #R).
	
	