examples
exampleRK4SolverOnSIRMultiHostModel
	"self new exampleRK4SolverOnSIRMultiHostModel"
	|model simulator output db|
	model := self modelRK4SolverOnSIRMultiHost.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.5 step: 0.0027.
	simulator executeOn: model.
	output := simulator data.
	db := (KEDiagramBuilder new) data: (output dataAt: '{#status: #I}') do: #sqrt.
	^ db open
	