examples
exampleRK4SolverOnSIRMultiHostModel
	"self new exampleRK4SolverOnSIRMultiHostModel"
	|model simulator db|
	model := self modelRK4SolverOnSIRMultiHost.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 by: 0.0027.
	simulator executeOn: model.
	self halt.
	db := (KEDiagramBuilder new) data: ((simulator allTimesSeriesContaining: '{#status: #I}') sqrt).
	^ db open
	