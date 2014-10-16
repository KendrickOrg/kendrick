examples
runGillespieDirectOnSEIRMeaslesModel
	"self new runGillespieDirectOnSEIRMeaslesModel"
	|model simulator|
	model := self createSEIRMeaslesModel.	
	simulator := KESimulatorBuilder new.
	
	simulator run: #GillespieDirect tMin: 0.0 tMax: 100 step: 0.01 model: model.
	simulator plot: #(S I R)
	
	
	