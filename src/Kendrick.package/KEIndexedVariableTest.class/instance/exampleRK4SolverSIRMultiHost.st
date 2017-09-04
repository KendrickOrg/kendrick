as yet unclassified
exampleRK4SolverSIRMultiHost
	"self new exampleRK4SolverSIRMultiHost"

	| model simulator db generator from result |
	model := self modelSIRMultiHost.
	simulator := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 0.5
		by: 0.0027.
	simulator executeOn: model.
	db := KEDiagramBuilder new
		data: (simulator allTimesSeriesContaining: '{#status: #I}') sqrt.
	db open
	"generator := KETransitionGenerator new.
	generator model: model.
	generator reAssignParameterN.
	from := Dictionary new: 2.
	from add: #status -> #empty.
	from add: #species -> #mosquito.
	result := model atCompartment: from"