examples
exampleRK4SolverOnSIRMultiHostModel
	"self new exampleRK4SolverOnSIRMultiHostModel"
	|model simulator db|
	model := self modelRK4SolverOnSIRMultiHost.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	db := (KEDiagramBuilder new) data: ((simulator timeSeriesOutputsAt: '{#status: #I}') sqrt).
	^ db open
	