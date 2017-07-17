as yet unclassified
testEdgesFromToAllOneWay
	|g|
	g := KEGraph nodes: #(A B C D E).
	g edgesFrom: #A toAll: #(B C D E) oneWay: true.
	
	self assert: (g edges size) equals: 4