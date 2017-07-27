examples
exampleRK4SolverOnMigrationTwoSpeciesModel
	| tmp1 tmp2 tmp3 tmp4 |
	tmp1 := self modelRK4SolverOnMigrationTwoSpeciesModel.
	tmp2 := KESimulator
		new: #RungeKutta
		from: 0
		to: 500
		by: 1.
	tmp2 executeOn: tmp1.
	tmp3 := KEDiagramBuilder new.
	tmp4 := [ :arg1 | 
	| tmp5 tmp6 tmp7 |
	tmp6 := (tmp2 allTimesSeriesContaining: arg1)
		collect: [ :arg2 | arg2 value ].
	tmp5 := OrderedCollection new.
	tmp7 := tmp6 first data size.
	1 to: tmp7 do: [ :tmp8 | tmp5 add: (tmp6 collect: [ :arg3 | arg3 data at: tmp8 ]) sum ].
	(KETimeSeries from: tmp5 withIndex: tmp6 first index)
		compartment: (STON fromString: arg1) ].
	tmp3
		data:
			(tmp2
				allTimesSeriesContaining:
					{(#status -> #I).
					(#species -> #bird)});
		xLabel: 'Time (days)'.
	^ tmp3 open