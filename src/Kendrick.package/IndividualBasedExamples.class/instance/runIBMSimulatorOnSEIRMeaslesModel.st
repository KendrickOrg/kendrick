tests
runIBMSimulatorOnSEIRMeaslesModel
	"self new runIBMSimulatorOnSEIRMeaslesModel"
	|model simulator|
	model := self createSEIRMeaslesModel.	
	simulator := KESimulatorBuilder new.
	
	simulator run: #IBMDiscreteTime tMin: 0.0 tMax: 200 step: 1 model: model.
	simulator plot: #(S I R)
	