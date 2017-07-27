examples
exampleRK4SolverOnMultiInfectiousStatusModel
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := self modelRK4SolverOnMultiInfectiousStatusModel.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 50
		by: 0.1.
	tmp2 executeOn: tmp1.
	tmp4 := OrderedCollection new.
	tmp4
		addAll: (tmp2 allTimesSeriesContaining: '{#status:#I}');
		addAll: (tmp2 allTimesSeriesContaining: '{#status:#Is}').
	tmp3 := KEDiagramBuilder new data: tmp4.
	^ tmp3 view