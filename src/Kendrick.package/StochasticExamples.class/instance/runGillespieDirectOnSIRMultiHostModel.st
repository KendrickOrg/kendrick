tests
runGillespieDirectOnSIRMultiHostModel
	"self new runGillespieDirectOnSIRMultiHostModel"
	|model|
	model := self createSIRMultiHostModel.
	model run: #GillespieDirect from: 0.0 to: 1.0 step: 0.001.
	model plot: #I do: #sqrt.
	