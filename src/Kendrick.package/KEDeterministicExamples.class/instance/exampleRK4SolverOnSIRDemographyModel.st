examples
exampleRK4SolverOnSIRDemographyModel
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnSIRDemography.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 146
		by: 0.1.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp3 data: (tmp2 allTimesSeriesContaining: '{#status: #I}').
	^ tmp3 open