examples
exampleRK4SolverOnSIRSimpleModel
	"self new exampleRK4SolverOnSIRSimpleModel"
	|model simulator output dB|
	model := self modelRK4SolverOnSIRSimpleModel.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 1.0 step: 0.001.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: '{#status: #I}').
	^ dB view