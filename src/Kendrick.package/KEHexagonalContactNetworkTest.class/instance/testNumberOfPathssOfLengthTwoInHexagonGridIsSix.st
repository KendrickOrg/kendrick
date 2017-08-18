tests
testNumberOfPathssOfLengthTwoInHexagonGridIsSix
	| network node |
	network := KEHexagonalContactNetwork new
		nodes: (1 to: 6 * 6);
		n: 6;
		m: 6.
	network run.
	node := network nodes at: 16.
	self assert: (network p2: node) equals: 6