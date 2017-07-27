examples
exampleRK4SolverOnMigrationOneSpeciesModel
	| tmp1 tmp2 tmp3 |
	tmp1 := self modelRK4SolverOnMigrationOneSpeciesModel.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		by: 1.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp3
		data:
			[ | tmp4 |
			tmp4 := OrderedCollection new.
			tmp4
				addAll: (tmp2 allTimesSeriesContaining: '{#status: #I,#patch:1}');
				addAll: (tmp2 allTimesSeriesContaining: '{#status: #I,#patch:2}');
				addAll: (tmp2 allTimesSeriesContaining: '{#status: #I,#patch:3}');
				addAll: (tmp2 allTimesSeriesContaining: '{#status: #I,#patch:4}');
				addAll: (tmp2 allTimesSeriesContaining: '{#status: #I,#patch:5}').
			tmp4 ] value;
		legends: {'patch 1' . 'patch 2' . 'patch 3' . 'patch 4' . 'patch 5'};
		legendTitle: 'Infectious';
		xLabel: 'Time (days)'.
	^ tmp3 open