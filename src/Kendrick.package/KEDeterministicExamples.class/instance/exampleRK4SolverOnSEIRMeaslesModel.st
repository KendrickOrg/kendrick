examples
exampleRK4SolverOnSEIRMeaslesModel
	"self new exampleRK4SolverOnSEIRMeaslesModel"
	|model simulator output diag |
	model := self modelRK4SolverOnSEIRMeasles.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 365 step: 1.
	simulator executeOn: model.
	output := simulator data.
	diag := (KEDiagramBuilder new) data: (output dataAt: #all).
	diag xLabel: 'Time (days)'.
	^ diag view
	