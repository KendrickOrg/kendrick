tests
testNumberOfCyclesOfLengthTreeInKleinbergWithPEqualsTwoIsThirty
	| grid2D node |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 2;
		q: 0;
		r: 2.
	grid2D run.
	node := grid2D nodes at: 90.
	self assert: (grid2D c3: node) equals: 30