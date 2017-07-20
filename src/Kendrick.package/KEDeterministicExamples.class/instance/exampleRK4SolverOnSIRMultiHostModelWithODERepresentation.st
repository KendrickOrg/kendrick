examples
exampleRK4SolverOnSIRMultiHostModelWithODERepresentation
	"self new exampleRK4SolverOnSIRMultiHostModelWithODERepresentation"
	|model simulator db|
	model := self modelRK4SolverOnSIRMultiHostModelWithODERepresentation.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	db := (KEDiagramBuilder new) data: ((simulator allTimesSeriesContaining: '{#status: #I}') sqrt).
	^ db view
	