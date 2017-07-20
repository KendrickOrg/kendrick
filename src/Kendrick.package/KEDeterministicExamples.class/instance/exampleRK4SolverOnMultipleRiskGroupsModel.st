examples
exampleRK4SolverOnMultipleRiskGroupsModel
	"self new exampleRK4SolverOnMultipleRiskGroupsModel"
	|model simulator  db|
	model := self modelRK4SolverOnMultipleRiskGroupsModel.	
	simulator := KESimulator new: #RungeKutta from: 0 to: 30 by: 0.01.
	simulator executeOn: model.

	db := KEDiagramBuilder new.
	db data: (simulator allTimesSeriesContaining: '{#status: #I}').
	db yLabel: 'Infectious'.
	^ db view
															
														