tests
testAddNode
	| tmp1 |
	tmp1 := KEGraph nodes: 100.
	self assert: tmp1 nodes size equals: 100