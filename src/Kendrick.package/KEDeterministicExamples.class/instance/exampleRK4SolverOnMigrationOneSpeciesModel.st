examples
exampleRK4SolverOnMigrationOneSpeciesModel
	"self new exampleRK4SolverOnMigrationOneSpeciesModel"
	|model simulator db tmp |
	model := self modelRK4SolverOnMigrationOneSpeciesModel.
	
	simulator := KESimulator new: #RungeKutta from: 0 to: 500 by: 1.
	simulator executeOn: model.
	
	db := KEDiagramBuilder new.
	tmp := OrderedCollection new.
	tmp addAll: (simulator allTimesSeriesContaining: '{#status: #I,#patch:1}');
	addAll: (simulator allTimesSeriesContaining: '{#status: #I,#patch:2}');
	addAll: (simulator allTimesSeriesContaining: '{#status: #I,#patch:3}');
	addAll: (simulator allTimesSeriesContaining: '{#status: #I,#patch:4}');
	addAll: (simulator allTimesSeriesContaining: '{#status: #I,#patch:5}').
	db data: tmp.
	db legends: { 'patch 1'. 'patch 2'. 'patch 3'. 'patch 4'. 'patch 5'}.
	db legendTitle: 'Infectious'.
	db xLabel: 'Time (days)'.
	db open
															
														