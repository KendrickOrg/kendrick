as yet unclassified
testScript
	self class = TestsIST
		ifTrue: [ self skip ].
	self script.
	(Visualization withId: self vizId) open