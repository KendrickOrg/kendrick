tests
testCompare2VariablesWithSameName
	| tmp1 tmp2 |
	tmp1 := KEVariable symbol: #S.
	tmp2 := KEVariable symbol: #S.
	self assert: true equals: tmp1 = tmp2