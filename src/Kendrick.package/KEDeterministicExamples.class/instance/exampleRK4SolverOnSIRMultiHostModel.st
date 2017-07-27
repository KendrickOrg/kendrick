examples
exampleRK4SolverOnSIRMultiHostModel
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnSIRMultiHost.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 0.5
		by: 0.0027.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new
		data: (tmp2 allTimesSeriesContaining: '{#status: #I}') sqrt.
	^ tmp3 open