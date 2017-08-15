tests
testNumberOfPathsOfLengthZeroIn2DGridIsOne
	| grid2D |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	self assert: (grid2D pathOfLength: 0 startingFrom: (grid2D nodes at: 100)) size equals: 1