as yet unclassified
run
	| tmp2 tmp4 tmp6 |
	tmp2 := Transcript.
	tmp2
		show: 'Measles';
		cr.
	TestMeaslesScripts new bench.
	tmp4 := Transcript.
	tmp4
		show: 'Infuenza 1SP';
		cr.
	TestDependantConcern new bench.
	tmp6 := Transcript.
	tmp6
		show: 'Infuenza 2SP';
		cr.
	TestMultiSpeciesSpatialDependant new bench