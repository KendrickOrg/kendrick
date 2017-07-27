examples
exampleRK4SolverOnSIRSimpleModelWithODERepresentation
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnSIRSimpleModelWithODERepresentation.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 0.3
		by: 0.0027.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp3
		data: tmp2 timeSeries;
		xLabel: 'Time (year)'.
	^ tmp3 open