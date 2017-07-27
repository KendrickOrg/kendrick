examples
exampleRK4SolverOnSeasonalForcingModel
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnSeasonalForcingModel.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 400
		by: 0.01.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp3 data: (tmp2 allTimesSeriesContaining: '{#status: #I}') log.
	^ tmp3 view