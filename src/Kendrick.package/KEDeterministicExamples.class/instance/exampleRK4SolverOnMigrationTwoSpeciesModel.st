examples
exampleRK4SolverOnMigrationTwoSpeciesModel
	"self new exampleRK4SolverOnMigrationTwoSpeciesModel"
	|model simulator db f|
	model := self modelRK4SolverOnMigrationTwoSpeciesModel.
	simulator := KESimulator new: #RungeKutta from: 0 to: 500 step: 1.
	simulator executeOn: model.
	db := KEDiagramBuilder new.
	
	f := [:name| |d tmp|
		tmp := (simulator timeSeriesAt: name) collect: [ :e| e value ].
		d := OrderedCollection new.
		1 to: tmp first data size do: [ :k| d add: (tmp collect: [:e| e data at: k]) sum ].
		(KETimeSeries from: d withIndex: tmp first index) compartment: (STON fromString: name)
		].
	db data: { 
		(f value: '{#status:#I,#species:#bird}'). 
		(f value: '{#status: #I, #species: #human}') }.

	db xLabel: 'Time (days)'.
	db legendTitle: 'Total of infectious'.
	db legends: { 'birds'. 'humans' }.

	^ db view															
														