examples
exampleRK4SolverOnSEIRMeaslesModelWithVaccination
	"self new exampleRK4SolverOnSEIRMeaslesModelWithVaccination"
	|model simulator diag |
	model := self modelRK4SolverOnSEIRMeaslesModelWithVaccination.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 100 step: 0.01.
	simulator executeOn: model.
	diag := (KEDiagramBuilder new) data: ((simulator allTimesSeriesContaining: '{#status: #I}') log).
	diag yLabel: 'log(Infectious)'.
	diag xLabel: 'Time (years)'.
	^ diag view
	