tests
testEdgesFromToAllOneWay
	| tmp1 |
	tmp1 := KEGraph nodes: #(#A #B #C #D #E).
	tmp1 edgesFrom: #A toAll: #(#B #C #D #E) oneWay: true.
	self assert: tmp1 edges size equals: 4