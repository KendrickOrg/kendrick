tests
testAtNode
	| tmp1 |
	tmp1 := KEGraph nodes: 100.
	self assert: (tmp1 atNode: #'1') label equals: #'1'