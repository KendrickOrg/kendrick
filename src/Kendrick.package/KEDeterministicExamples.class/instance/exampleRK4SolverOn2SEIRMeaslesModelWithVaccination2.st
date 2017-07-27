examples
exampleRK4SolverOn2SEIRMeaslesModelWithVaccination2
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnSEIRMeaslesModelWithVaccination.
	tmp1 atParameter: #p assignValue: 0.7.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 100
		by: 0.01.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder2 new.
	tmp3
		addTimeSeries: (tmp2 timesSeriesAt: '{#status: #I}') log
		withKey: '{#status: #I} p = 0.7'.
	tmp1
		resetCompartments;
		atParameter: #p assignValue: 0.0.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 100
		by: 0.01.
	tmp2 executeOn: tmp1.
	tmp3
		addTimeSeries: (tmp2 timesSeriesAt: '{#status: #I}') log
			withKey: '{#status: #I} p = 0.0';
		xLabel: 'Time (years)';
		yLabel: 'log(Infectious)';
		legendTitle: 'Vaccination Rate'.
	^ tmp3 open2