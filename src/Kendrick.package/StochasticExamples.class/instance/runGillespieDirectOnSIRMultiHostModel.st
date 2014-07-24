tests
runGillespieDirectOnSIRMultiHostModel
	"self new runGillespieDirectOnSIRMultiHostModel"
	|model|
	model := self createSIRMultiHostModel.
	model run: 'stochastic' from: 0.0 to: 1.0 step: 0.001 algorithm: #GillespieDirect.
	model plot: #I do: #sqrt.
	