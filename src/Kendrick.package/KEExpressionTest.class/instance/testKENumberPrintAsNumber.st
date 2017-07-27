tests
testKENumberPrintAsNumber
	| tmp1 |
	tmp1 := KENumerical number: 10.
	self assert: '10' equals: tmp1 asString