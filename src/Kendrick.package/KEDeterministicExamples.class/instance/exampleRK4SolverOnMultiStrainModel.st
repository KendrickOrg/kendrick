examples
exampleRK4SolverOnMultiStrainModel
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := self modelRK4SolverOnMultiStrainModel.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 150
		by: 0.1.
	tmp2 executeOn: tmp1.
	tmp4 := OrderedCollection new.
	tmp4
		addAll: (tmp2 allTimesSeriesContaining: '{#status: #I1}');
		addAll: (tmp2 allTimesSeriesContaining: '{#status: #I2}').
	tmp3 := KEDiagramBuilder new data: tmp4.
	^ tmp3 open