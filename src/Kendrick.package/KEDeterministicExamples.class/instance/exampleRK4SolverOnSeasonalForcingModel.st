examples
exampleRK4SolverOnSeasonalForcingModel
	"self new exampleRK4SolverOnSeasonalForcingModel"
	|model simulator  dB |
	model := self modelRK4SolverOnSeasonalForcingModel.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 400 step: 0.01.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator timeSeriesAt: '{#status: #I}') do: #log.
	^ dB view