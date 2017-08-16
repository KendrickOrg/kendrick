tests
testNumberOfPathsOfLengthTwoInTriangularGridIsThirty
	| gridTriang node |
	gridTriang := KETriangularContactNetwork new
		nodes: (1 to: 11 * 11);
		n: 11;
		m: 11.
	gridTriang run.
	node := gridTriang nodes at: 39.
	self assert: (gridTriang p2: node)  equals: 30