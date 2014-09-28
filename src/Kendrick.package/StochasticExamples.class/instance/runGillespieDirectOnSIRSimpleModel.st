tests
runGillespieDirectOnSIRSimpleModel
	"self new runGillespieDirectOnSIRSimpleModel"
	|model simulator|
	model := self createSIRSimpleModel.
	
	simulator := KESimulatorBuilder new.
	
	simulator run: #GillespieDirect tMin: 0.0 tMax: 1.0 step: 0.001 model: model.
	simulator plot: #(S I R)
	
	