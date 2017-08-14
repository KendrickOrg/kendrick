tests
testNumberOfPathsOfLengthTwoIn2DGridIsTwelve
	| grid2D |
	grid2D := KEKleinbergContactNetwork new
		nodes: (1 to: 25 * 25);
		n: 25;
		p: 1;
		q: 0;
		r: 2.
	grid2D run.
	self assert: (grid2D pathOfLength: 2 startingFrom: (grid2D nodes at: 90)) size equals: 12