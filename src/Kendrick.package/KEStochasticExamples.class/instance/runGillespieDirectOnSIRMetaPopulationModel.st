examples
runGillespieDirectOnSIRMetaPopulationModel
	"self new runGillespieDirectOnSIRMetaPopulationModel"
	|model simulator|
	model := self createSIRMetaPopulationModel. 
	simulator := KESimulatorBuilder new.	
	simulator addAdapter: KECouplingAdapter new.
	simulator run: #GillespieDirect tMin: 0.0 tMax: 1.0 step: 0.001 model: model.
	simulator plot: #I do: #sqrt.
	
	