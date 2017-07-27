examples
exampleRK4SolverOnSIRMultiHostModelTransitionByRate
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnSIRMultiHostModelTransitionByRate.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 40.0
		by: 0.01.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new
		data: (tmp2 allTimesSeriesContaining: '{#status: #I}') sqrt.
	^ tmp3 view