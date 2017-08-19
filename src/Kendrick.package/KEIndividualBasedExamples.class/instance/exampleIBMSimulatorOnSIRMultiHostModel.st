examples
exampleIBMSimulatorOnSIRMultiHostModel
	"self new exampleIBMSimulatorOnSIRMultiHostModel"

	| model simulator db t |
	
	t := KEIndexedVariableTest new.
	"model := t modelSIRMultiHost."
	model := t modelSIRKEModelPart.
	simulator := KESimulator
		new: #IBM
		from: 0.0
		to: 0.5
		by: 0.0027.
	simulator executeOn: model.
	db := KEDiagramBuilder new
		data: (simulator allTimesSeriesContaining: '{#status: #I}') sqrt.
	db open