examples
exampleRK4SolverOnSIRSimpleModelWithODERepresentation
	"self new exampleRK4SolverOnSIRSimpleModelWithODERepresentation"
	|model simulator output dB |
	model := self modelRK4SolverOnSIRSimpleModelWithODERepresentation.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 1.0 step: 0.0027.
	simulator executeOn: model.
	output := simulator data.
	dB := KEDiagramBuilder new.
	dB data: (output dataAt: '{#status: #I}').
	^ dB view