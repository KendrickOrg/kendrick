tests
runGillespieDirectOnSIRMetaPopulationWithMovementModel
	"self new runGillespieDirectOnSIRMetaPopulationWithMovementModel"
	|model|
	model := self createSIRMetaPopulationWithMovementModel.
	model simulator addAdapter: KEGraphAdapter new.
	model run: #GillespieDirect from: 0.0 to: 1000 step: 0.1.
	model plot: #I "population: #(0 5)".
	
	