examples
exampleRK4SolverOnSeasonalForcingModel
	"self new exampleRK4SolverOnSeasonalForcingModel"
	|model simulator output dB |
	model := self modelRK4SolverOnSeasonalForcingModel.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 400 step: 0.01.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: '{#status: #I}') do: #log.
	^ dB view