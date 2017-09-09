as yet unclassified
exampleIBMSolverSIRMultiHost
	"self new exampleIBMSolverSIRMultiHost"

	| model simulator db |
	model := self modelSIRMultiHost.

	
	simulator := KEIndividualBasedSimulator new
		tMin: 0.0;
		tMax: 0.5;
		step: 0.0027;
		model: model.
	simulator executeOn: model.
	db := KEDiagramBuilder new
		data: (simulator allTimesSeriesContaining: '{#status: #I}') sqrt.
	db open