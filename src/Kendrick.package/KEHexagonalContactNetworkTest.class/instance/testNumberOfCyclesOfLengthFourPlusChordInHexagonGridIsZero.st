tests
testNumberOfCyclesOfLengthFourPlusChordInHexagonGridIsZero
	| gridTriang node |
	gridTriang := KEHexagonalContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	gridTriang run.
	node := gridTriang nodes at: 16.
	self assert: (gridTriang cc4: node) equals: 0