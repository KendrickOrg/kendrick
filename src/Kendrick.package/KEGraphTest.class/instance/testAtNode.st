tests
testAtNode
	| g |
	g := KEGraph nodes: 100.
	self assert: (g atNode: #'1') label equals: #'1'