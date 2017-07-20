examples
exampleRK4SolverOnSEIRMeaslesModel
	"self new exampleRK4SolverOnSEIRMeaslesModel"
	|model simulator diag |
	model := self modelRK4SolverOnSEIRMeasles.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 365 step: 1.
	simulator executeOn: model.
	diag := (KEDiagramBuilder new) data: simulator timeSeries.
	diag xLabel: 'Time (days)'.
	^ diag open
	