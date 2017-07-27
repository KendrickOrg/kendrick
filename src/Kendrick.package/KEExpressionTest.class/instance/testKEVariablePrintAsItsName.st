tests
testKEVariablePrintAsItsName
	| tmp1 |
	tmp1 := KEVariable symbol: #beta.
	self assert: 'beta' equals: tmp1 asString