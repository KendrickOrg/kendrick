examples
exampleRK4SolverOnMigrationOneSpeciesModel
	"self new exampleRK4SolverOnMigrationOneSpeciesModel"
	|model simulator db|
	model := self modelRK4SolverOnMigrationOneSpeciesModel.
	
	simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
	simulator executeOn: model.
	
	db := KEDiagramBuilder new.
	db data: [|tmp| tmp := OrderedCollection new.
	tmp addAll: (simulator timeSeriesOutputsAt: '{#status: #I,#patch:1}').
	tmp addAll: (simulator timeSeriesOutputsAt: '{#status: #I,#patch:2}').
	tmp addAll: (simulator timeSeriesOutputsAt: '{#status: #I,#patch:3}').
	tmp addAll: (simulator timeSeriesOutputsAt: '{#status: #I,#patch:4}').
	tmp addAll: (simulator timeSeriesOutputsAt: '{#status: #I,#patch:5}').
	tmp] value.
	db legends: { 'patch 1'. 'patch 2'. 'patch 3'. 'patch 4'. 'patch 5'}.
	db legendTitle: 'Infectious'.
	db xLabel: 'Time (days)'.
	^ db open
															
														