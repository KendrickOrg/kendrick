examples
exampleRK4SolverOnSEIRMeaslesModel
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnSEIRMeasles.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 365
		by: 1.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new data: tmp2 timeSeries.
	tmp3 xLabel: 'Time (days)'.
	^ tmp3 open