examples
exampleRK4SolverOnMultiInfectiousStatusModel
	"self new exampleRK4SolverOnMultiInfectiousStatusModel"
	|model simulator db data|
	model := self modelRK4SolverOnMultiInfectiousStatusModel.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 50 step: 0.1.
	simulator executeOn: model.
	data := OrderedCollection new.
	data addAll: (simulator allTimesSeriesContaining: '{#status:#I}').
	data addAll: (simulator allTimesSeriesContaining: '{#status:#Is}').
	db := KEDiagramBuilder new data: data.
	^ db view
	 
															
														