tests
runGillespieDirectOnSIRMultiHostModel
	"self new runGillespieDirectOnSIRMultiHostModel"
	|model simulator|
	model := self createSIRMultiHostModel.
	simulator := KESimulatorBuilder new.
	
	simulator run: #GillespieDirect tMin: 0.0 tMax: 1.0 step: 0.001 model: model. 
	simulator plot: #I do: #sqrt.
	