tests
testEdgesFromToAll
	| g |
	g := KEGraph nodes: #(A B C D E).
	g edgesFrom: #A toAll: #(B C D E).
	self assert: g edges size equals: 8