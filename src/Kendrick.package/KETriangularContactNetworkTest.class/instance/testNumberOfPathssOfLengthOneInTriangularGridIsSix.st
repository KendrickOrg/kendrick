tests
testNumberOfPathssOfLengthOneInTriangularGridIsSix
	| gridTriang node |
	gridTriang := KETriangularContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	gridTriang run.
	node := gridTriang nodes at: 15.
	self assert: (gridTriang pathOfLength: 1 startingFrom: node) size equals: 6