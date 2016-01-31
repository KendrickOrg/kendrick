examples
exampleRK4SolverOnSIRSimpleModel
	"self new exampleRK4SolverOnSIRSimpleModel"
	|model simulator dB|
	model := self modelRK4SolverOnSIRSimpleModel.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 0.3 step: 0.001.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator timeSeriesAt: '{#status: #I}').
	dB xLabel: 'Time (year)'.
	^ dB open