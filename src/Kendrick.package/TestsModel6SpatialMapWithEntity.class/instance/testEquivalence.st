as yet unclassified
testEquivalence
	| tmp1 tmp2 tmp3 tmp4 tmp6 |
	self createModels.
	beforeModel inspect.
	afterModel keModel inspect.
	tmp3 := beforeDiagram data sorted
		collect: [ :arg1 | arg1 roundDownTo: 0.001 ].
	tmp4 := afterDiagram data sorted
		collect: [ :arg2 | arg2 roundDownTo: 0.001 ].
	tmp6 := Transcript.
	tmp6
		show: tmp3;
		cr;
		show: tmp4;
		cr;
		cr.
	self assert: tmp3 = tmp4