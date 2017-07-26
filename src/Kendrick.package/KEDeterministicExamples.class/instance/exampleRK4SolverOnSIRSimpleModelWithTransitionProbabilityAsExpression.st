examples
exampleRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression
	"self new exampleRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression"
	|model simulator dB|
	model := self modelRK4SolverOnSIRSimpleModelWithTransitionProbabilityAsExpression.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 1.0 step: 0.0027.
	simulator executeOn: model.
	dB := KEDiagramBuilder new.
	dB data: (simulator timeSeriesOutputsAt: '{#status: #I}').
	^ dB view