examples
exampleRK4SolverOnSIRMultiHostModelTransitionByRate
	"self new exampleRK4SolverOnSIRMultiHostModelTransitionByRate"
	|model simulator db|
	model := self modelRK4SolverOnSIRMultiHostModelTransitionByRate.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 40.0 step: 0.01.
	simulator executeOn: model.
	db := (KEDiagramBuilder new) data: ((simulator timeSeriesOutputsAt: '{#status: #I}') sqrt).
	^ db view
	