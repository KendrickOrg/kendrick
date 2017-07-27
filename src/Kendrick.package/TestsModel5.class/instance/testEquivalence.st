as yet unclassified
testEquivalence
	| tmp1 tmp2 tmp4 |
	self createModels.
	beforeModel inspect.
	afterModel keModel inspect.
	tmp1 := (beforeDiagram data
		collect: [ :arg1 | arg1 peakOfEpidemic floor ]) sorted
		asOrderedCollection.
	tmp2 := (afterDiagram data
		collect: [ :arg2 | arg2 peakOfEpidemic floor ]) sorted
		asOrderedCollection.
	tmp4 := Transcript.
	tmp4
		show: tmp1;
		cr;
		show: tmp2;
		cr;
		cr.
	self assert: tmp1 = tmp2