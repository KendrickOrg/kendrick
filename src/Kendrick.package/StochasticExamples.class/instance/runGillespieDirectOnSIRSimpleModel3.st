tests
runGillespieDirectOnSIRSimpleModel3
	"self new runGillespieDirectOnSIRSimpleModel3"
	|model simulator|
	model := self createSIRSimpleModel3 .
	
	simulator := KESimulatorBuilder new.
	
	simulator run: #GillespieDirect tMin: 0.0 tMax: 200 step: 0.001 model: model.
	simulator plot: #(S I R)
	
	