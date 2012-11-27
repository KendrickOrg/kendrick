tests
testCompare2VariablesWithSameName
	| a b |
	a := KEVariable symbol: #S.
	b := KEVariable symbol: #S.
	self assert: a = b