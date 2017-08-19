tests
testBuiltAVariableWithAName
	| g |
	g := KEVariable symbol: #gamma.
	self assert: g symbol equals: #gamma