examples
exampleRK4SolverOn2SEIRMeaslesModelWithVaccination
	| tmp1 tmp2 tmp3 tmp4 tmp5 |
	tmp1 := self modelRK4SolverOnSEIRMeaslesModelWithVaccination.
	tmp4 := OrderedCollection new.
	tmp5 := OrderedCollection new.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 100
		by: 0.01.
	tmp2 executeOn: tmp1.
	tmp4 addAll: (tmp2 allTimesSeriesContaining: '{#status: #I}').
	tmp1
		atParameter: #p assignValue: 0.0;
		resetCompartments.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0.0
		to: 100
		by: 0.01.
	tmp2 executeOn: tmp1.
	tmp4 addAll: (tmp2 allTimesSeriesContaining: '{#status: #I}').
	tmp5 addAll: #('p = 0.7' 'p = 0.0').
	tmp3 := KEDiagramBuilder new data: tmp4 log.
	tmp3
		legends: tmp5;
		xLabel: 'Time (years)';
		yLabel: 'log(Infectious)';
		legendTitle: 'Vaccination Rate'.
	^ tmp3 open