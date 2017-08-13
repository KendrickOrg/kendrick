tests
testNumberOfCyclesOfLengthFourPlusChordInGrid2DIsZero
	| grid2D node |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 5 * 5);
		n: 5;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	node := grid2D nodes at: 13.
	self assert: (grid2D cc4: node) equals: 0