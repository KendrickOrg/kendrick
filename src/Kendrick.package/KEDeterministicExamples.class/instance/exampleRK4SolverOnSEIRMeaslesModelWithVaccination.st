examples
exampleRK4SolverOnSEIRMeaslesModelWithVaccination
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnSEIRMeaslesModelWithVaccination.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 100
		by: 0.01.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new
		data: (tmp2 allTimesSeriesContaining: '{#status: #I}') log.
	tmp3
		yLabel: 'log(Infectious)';
		xLabel: 'Time (years)'.
	^ tmp3 view