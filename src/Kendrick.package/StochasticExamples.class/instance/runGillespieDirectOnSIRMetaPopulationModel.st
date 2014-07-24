tests
runGillespieDirectOnSIRMetaPopulationModel
	"self new runGillespieDirectOnSIRMetaPopulationModel"
	|model|
	model := self createSIRMetaPopulationModel. 	
	model run: 'stochastic' from: 0.0 to: 1.0 step: 0.001 algorithm: #GillespieDirect.
	model plot: #I do: #sqrt.
	
	