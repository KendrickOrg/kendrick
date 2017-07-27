as yet unclassified
testAdjacentNodes
	| tmp1 tmp2 |
	tmp1 := KEGraph nodes: #(#A #B #C #D #E).
	tmp1 edgesFrom: #A toAll: #(#B #C #D #E).
	tmp2 := tmp1 atNode: #A.
	self assert: tmp2 adjacentNodes size equals: 4