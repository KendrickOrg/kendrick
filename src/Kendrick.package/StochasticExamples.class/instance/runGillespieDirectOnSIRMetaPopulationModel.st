tests
runGillespieDirectOnSIRMetaPopulationModel
	"self new runGillespieDirectOnSIRMetaPopulationModel"
	|model|
	model := self createSIRMetaPopulationModel. 	
	model simulator addAdapter: KEGraphAdapter new.
	model run: #GillespieDirect from: 0.0 to: 1.0 step: 0.001.
	model plot: #I do: #sqrt.
	
	