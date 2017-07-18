examples
exampleRK4SolverOnMultiStrainModel
	"self new exampleRK4SolverOnMultiStrainModel"
	|model simulator db data|
	model := self modelRK4SolverOnMultiStrainModel.
	simulator := KESimulator new: #RungeKutta from: 0.0 to: 150 step: 0.1.
	simulator executeOn: model.
	data := OrderedCollection new.
	data addAll: (simulator timeSeriesAt: '{#status: #I1}').
	data addAll: (simulator timeSeriesAt: '{#status: #I2}').
	db := KEDiagramBuilder new data: data.
	^ db open							
														